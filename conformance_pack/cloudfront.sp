locals {
  conformance_pack_cloudfront_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudFront"
  })
}

control "cloudfront_distribution_encryption_in_transit_enabled" {
  title       = "CloudFront distributions should require encryption in transit"
  description = "This control checks whether an Amazon CloudFront distribution requires viewers to use HTTPS directly or whether it uses redirection. The control fails if ViewerProtocolPolicy is set to allow-all for defaultCacheBehavior or for cacheBehaviors."
  query       = query.cloudfront_distribution_encryption_in_transit_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    audit_manager_pci_v321 = "true"
    gdpr                   = "true"
    hipaa                  = "true"
    soc_2                  = "true"
  })
}

control "cloudfront_distribution_geo_restrictions_enabled" {
  title       = "CloudFront distributions should have geo restriction enabled"
  description = "Geographic restriction is used to restrict access to all of the files that are associated with a distribution at the country level."
  query       = query.cloudfront_distribution_geo_restrictions_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    other_checks = "true"
  })
}

control "cloudfront_distribution_use_secure_cipher" {
  title       = "CloudFront distributions should use secure SSL cipher"
  description = "Ensure that CloudFront distributions do not have any insecure SSL ciphers. Using insecure and deprecated ciphers could make the SSL connection between the CloudFront and the origins vulnerable to exploits."
  query       = query.cloudfront_distribution_use_secure_cipher

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    other_checks = "true"
  })
}

control "cloudfront_distribution_non_s3_origins_encryption_in_transit_enabled" {
  title       = "CloudFront distributions should encrypt traffic to non S3 origins"
  description = "This control ensures that conection between cloudfront and oriign server is encrypted. It is recommended to enforce HTTPS-only traffic between a CloudFront distribution and the origin."
  query       = query.cloudfront_distribution_non_s3_origins_encryption_in_transit_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    other_checks = "true"
  })
}

control "cloudfront_distribution_no_deprecated_ssl_protocol" {
  title       = "CloudFront distributions should not use deprecated SSL protocols between edge locations and custom origins"
  description = "This control checks if Amazon CloudFront distributions are using deprecated SSL protocols for HTTPS communication between CloudFront edge locations and your custom origins. This control fails if a CloudFront distribution has a CustomOriginConfig where OriginSslProtocols includes SSLv3."
  query       = query.cloudfront_distribution_no_deprecated_ssl_protocol

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "cloudfront_distribution_custom_origins_encryption_in_transit_enabled" {
  title       = "CloudFront distributions should encrypt traffic to custom origins"
  description = "This control checks if Amazon CloudFront distributions are encrypting traffic to custom origins. This control fails for a CloudFront distribution whose origin protocol policy allows 'http-only'. This control also fails if the distribution's origin protocol policy is 'match-viewer' while the viewer protocol policy is 'allow-all'."
  query       = query.cloudfront_distribution_custom_origins_encryption_in_transit_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "cloudfront_distribution_logging_enabled" {
  title       = "CloudFront distributions access logs should be enabled"
  description = "This control checks if Amazon CloudFront distributions are configured to capture information from Amazon Simple Storage Service (Amazon S3) server access logs. This rule is non compliant if a CloudFront distribution does not have logging configured."
  query       = query.cloudfront_distribution_logging_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    cis_controls_v8_ig1 = "true"
  })
}

query "cloudfront_distribution_encryption_in_transit_enabled" {
  sql = <<-EOQ
    with data as (
      select
        distinct arn
      from
        aws_cloudfront_distribution,
          jsonb_array_elements(
        case jsonb_typeof(cache_behaviors -> 'Items')
            when 'array' then (cache_behaviors -> 'Items')
            else null end
        ) as cb
      where
        cb ->> 'ViewerProtocolPolicy' = 'allow-all'
    )
    select
      b.arn as resource,
      case
        when d.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') then 'alarm'
        else 'ok'
      end as status,
      case
        when d.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') then title || ' data not encrypted in transit.'
        else title || ' data encrypted in transit.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_cloudfront_distribution as b
      left join data as d on b.arn = d.arn;
  EOQ
}

query "cloudfront_distribution_geo_restrictions_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when restrictions -> 'GeoRestriction' ->> 'RestrictionType' = 'none' then 'alarm'
        else 'ok'
      end as status,
      case
        when restrictions -> 'GeoRestriction' ->> 'RestrictionType' = 'none' then title || ' Geo Restriction disabled.'
        else title || ' Geo Restriction enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution;
  EOQ
}

query "cloudfront_distribution_use_secure_cipher" {
  sql = <<-EOQ
    with origin_protocols as (
      select
        distinct arn,
        o -> 'CustomOriginConfig' ->> 'OriginSslProtocols' as origin_ssl_policy
      from
        aws_cloudfront_distribution,
        jsonb_array_elements(origins) as o
      where
        o -> 'CustomOriginConfig' -> 'OriginSslProtocols' -> 'Items' @> '["TLSv1.2%", "TLSv1.1%"]'
    )
    select
      b.arn as resource,
      case
        when o.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when o.arn is not null then title || ' use secure cipher.'
        else title || ' does not use secure cipher.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_cloudfront_distribution as b
      left join origin_protocols as o on b.arn = o.arn;
  EOQ
}

query "cloudfront_distribution_non_s3_origins_encryption_in_transit_enabled" {
  sql = <<-EOQ
    with viewer_protocol_policy_value as (
      select
        distinct arn
      from
        aws_cloudfront_distribution,
          jsonb_array_elements(
        case jsonb_typeof(cache_behaviors -> 'Items')
            when 'array' then (cache_behaviors -> 'Items')
            else null end
        ) as cb
      where
        cb ->> 'ViewerProtocolPolicy' = 'allow-all'
    ),
    origin_protocol_policy_value as (
      select
        distinct arn,
        o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' as origin_protocol_policy
      from
        aws_cloudfront_distribution,
        jsonb_array_elements(origins) as o
      where
        o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' = 'http-only'
        or o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' = 'match-viewer'
        and o -> 'S3OriginConfig' is null
    )
    select
      b.arn as resource,
      case
        when o.arn is not null and o.origin_protocol_policy = 'http-only' then 'alarm'
        when o.arn is not null and o.origin_protocol_policy = 'match-viewer' and ( v.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') ) then 'alarm'
        else 'ok'
      end as status,
      case
        when o.arn is not null and o.origin_protocol_policy = 'http-only' then title || ' origins traffic not encrypted in transit.'
        when o.arn is not null and o.origin_protocol_policy = 'match-viewer' and ( v.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') ) then title || ' origins traffic not encrypted in transit.'
        else title || ' origins traffic encrypted in transit.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_cloudfront_distribution as b
      left join origin_protocol_policy_value as o on b.arn = o.arn
      left join viewer_protocol_policy_value as v on b.arn = v.arn;
  EOQ
}

query "cloudfront_distribution_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when logging ->> 'Enabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when logging ->> 'Enabled' = 'true' then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution;
  EOQ
}

# Non-Config rule query

query "cloudfront_distribution_configured_with_origin_failover" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when origin_groups ->> 'Items' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when origin_groups ->> 'Items' is not null then title || ' origin group is configured.'
        else title || ' origin group not configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution;
  EOQ
}

query "cloudfront_distribution_custom_origins_encryption_in_transit_enabled" {
  sql = <<-EOQ
    with viewer_protocol_policy_value as (
      select
        distinct arn
      from
        aws_cloudfront_distribution,
          jsonb_array_elements(
        case jsonb_typeof(cache_behaviors -> 'Items')
            when 'array' then (cache_behaviors -> 'Items')
            else null end
        ) as cb
      where
        cb ->> 'ViewerProtocolPolicy' = 'allow-all'
    ),
    origin_protocol_policy_value as (
      select
        distinct arn,
        o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' as origin_protocol_policy
      from
        aws_cloudfront_distribution,
        jsonb_array_elements(origins) as o
      where
        o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' = 'http-only'
        or o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' = 'match-viewer'
    )
    select
      b.arn as resource,
      case
        when o.arn is not null and o.origin_protocol_policy = 'http-only' then 'alarm'
        when o.arn is not null and o.origin_protocol_policy = 'match-viewer' and ( v.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') ) then 'alarm'
        else 'ok'
      end as status,
      case
        when o.arn is not null and o.origin_protocol_policy = 'http-only' then title || ' custom origins traffic not encrypted in transit.'
        when o.arn is not null and o.origin_protocol_policy = 'match-viewer' and ( v.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') )  then title || ' custom origins traffic not encrypted in transit.'
        else title || ' custom origins traffic encrypted in transit.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution as b
      left join origin_protocol_policy_value as o on b.arn = o.arn
      left join viewer_protocol_policy_value as v on b.arn = v.arn;
  EOQ
}

query "cloudfront_distribution_default_root_object_configured" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when default_root_object = '' then 'alarm'
        else 'ok'
      end as status,
      case
        when default_root_object = '' then title || ' default root object not configured.'
        else title || ' default root object configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution;
  EOQ
}

query "cloudfront_distribution_no_deprecated_ssl_protocol" {
  sql = <<-EOQ
    with origin_ssl_protocols as (
      select
        distinct arn,
        o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' as origin_protocol_policy
      from
        aws_cloudfront_distribution,
        jsonb_array_elements(origins) as o
      where
        o -> 'CustomOriginConfig' -> 'OriginSslProtocols' -> 'Items' @> '["SSLv3"]'
    )
    select
      b.arn as resource,
      case
        when o.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when o.arn is null then title || ' does not have deprecated SSL protocols.'
        else title || ' has deprecated SSL protocols.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution as b
      left join origin_ssl_protocols as o on b.arn = o.arn;
  EOQ
}

query "cloudfront_distribution_no_non_existent_s3_origin" {
  sql = <<-EOQ
    with distribution_with_non_existent_bucket as (
      select
        distinct d.arn as arn,
        to_jsonb(string_to_array((string_agg(split_part(o ->> 'Id', '.s3', 1), ',')),',')) as bucket_name_list
      from
        aws_cloudfront_distribution as d,
        jsonb_array_elements(d.origins) as o
        left join aws_s3_bucket as b on b.name = split_part(o ->> 'Id', '.s3', 1)
      where
        b.name is null
        and o ->> 'DomainName' like '%.s3.%'
      group by
        d.arn
    )
    select
      distinct b.arn as resource,
      case
        when b.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is null then title || ' does not point to any non-existent S3 origins.'
        when jsonb_array_length(b.bucket_name_list) > 0
          then title ||
        case
          when jsonb_array_length(b.bucket_name_list) > 2
            then concat(' point to non-existent S3 origins ', b.bucket_name_list #>> '{0}', ', ', b.bucket_name_list #>> '{1}', ' and ' || (jsonb_array_length(b.bucket_name_list) - 2)::text || ' more.' )
          when jsonb_array_length(b.bucket_name_list) = 2
            then concat(' point to non-existent S3 origins ', b.bucket_name_list #>> '{0}', ' and ', b.bucket_name_list #>> '{1}', '.')
        else concat(' point to non-existent S3 origin ', b.bucket_name_list #>> '{0}', '.')
        end
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution as d
      left join distribution_with_non_existent_bucket as b on b.arn = d.arn;
  EOQ
}

query "cloudfront_distribution_origin_access_identity_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when o ->> 'DomainName' not like '%s3.amazonaws.com' then 'skip'
        when o ->> 'DomainName' like '%s3.amazonaws.com'
        and o -> 'S3OriginConfig' ->> 'OriginAccessIdentity' = '' then 'alarm'
        else 'ok'
      end as status,
      case
        when o ->> 'DomainName' not like '%s3.amazonaws.com' then title || ' origin type is not s3.'
        when o ->> 'DomainName' like '%s3.amazonaws.com'
        and o -> 'S3OriginConfig' ->> 'OriginAccessIdentity' = '' then title || ' origin access identity not configured.'
        else title || ' origin access identity configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution,
      jsonb_array_elements(origins) as o;
  EOQ
}

query "cloudfront_distribution_sni_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when viewer_certificate ->> 'SSLSupportMethod' = 'sni-only' then 'ok'
        else 'alarm'
      end as status,
      case
        when viewer_certificate ->> 'SSLSupportMethod' = 'sni-only' then title || ' SNI enabled.'
        else title || ' SNI disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution;
  EOQ
}

query "cloudfront_distribution_use_custom_ssl_certificate" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when viewer_certificate ->> 'ACMCertificateArn' is not null and viewer_certificate ->> 'Certificate' is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when viewer_certificate ->> 'ACMCertificateArn' is not null and viewer_certificate ->> 'Certificate' is not null then title || ' uses custom SSL certificate.'
        else title || ' does not use custom SSL certificate.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution;
  EOQ
}

query "cloudfront_distribution_waf_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when web_acl_id <> '' then 'ok'
        else 'alarm'
      end as status,
      case
        when web_acl_id <> '' then title || ' associated with WAF.'
        else title || ' not associated with WAF.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution;
  EOQ
}

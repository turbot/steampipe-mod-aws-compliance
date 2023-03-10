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
    gdpr  = "true"
    hipaa = "true"
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
      -- Required Columns
      b.arn as resource,
      case
        when d.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') then 'alarm'
        else 'ok'
      end as status,
      case
        when d.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') then title || ' data not encrypted in transit.'
        else title || ' data encrypted in transit.'
      end as reason
      -- Additional Dimensions
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
      -- Required Columns
      arn as resource,
      case
        when restrictions -> 'GeoRestriction' ->> 'RestrictionType' = 'none' then 'alarm'
        else 'ok'
      end as status,
      case
        when restrictions -> 'GeoRestriction' ->> 'RestrictionType' = 'none' then title || ' Geo Restriction disabled.'
        else title || ' Geo Restriction enabled.'
      end as reason
      -- Additional Dimensions
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
      -- Required Columns
      b.arn as resource,
      case
        when o.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when o.arn is not null then title || ' use secure cipher.'
        else title || ' does not use secure cipher.'
      end as reason
      -- Additional Dimensions
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
      -- Required Columns
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
      -- Additional Dimensions
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
      -- Required Columns
      arn as resource,
      case
        when logging ->> 'Enabled' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when logging ->> 'Enabled' = 'true' then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudfront_distribution;
  EOQ
}

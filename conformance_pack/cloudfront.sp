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

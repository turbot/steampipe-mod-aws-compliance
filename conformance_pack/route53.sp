locals {
  conformance_pack_route53_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Route53"
  })
}

control "route53_zone_query_logging_enabled" {
  title       = "Route 53 zones should have query logging enabled"
  description = "Ensure Route 53 zones have query logging enabled."
  query       = query.route53_zone_query_logging_enabled

  tags = merge(local.conformance_pack_route53_common_tags, {
    other_checks = "true"
  })
}

control "route53_domain_transfer_lock_enabled" {
  title       = "Route 53 domains should have transfer lock enabled"
  description = "Ensure Route 53 registered domains are locked to prevent any unauthorized transfers to another domain name registrar."
  query       = query.route53_domain_transfer_lock_enabled

  tags = merge(local.conformance_pack_route53_common_tags, {
    other_checks = "true"
  })
}

query "route53_zone_query_logging_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      id as resource,
      case
        when private_zone then 'skip'
        when query_logging_configs is not null or jsonb_array_length(query_logging_configs) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when private_zone then title || ' is private hosted zone.'
        when query_logging_configs is not null or jsonb_array_length(query_logging_configs) > 0 then title || ' query logging to CloudWatch enabled.'
        else title || ' query logging to CloudWatch disabled.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_route53_zone;
  EOQ
}

query "route53_domain_transfer_lock_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      arn as resource,
      case
        when transfer_lock then 'ok'
        else 'alarm'
      end as status,
      case
        when transfer_lock then title || ' transfer lock enabled.'
        else title || ' transfer lock disabled.'
        end reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_route53_domain;
  EOQ
}

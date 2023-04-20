locals {
  conformance_pack_route53_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Route53"
  })
}

control "route53_domain_auto_renew_enabled" {
  title       = "Route 53 domains auto renew should be enabled"
  description = "This control ensures that AWS Route 53 Auto Renew feature is enabled to automatically renew your domain names as the expiration date approaches."
  query       = query.route53_domain_auto_renew_enabled

  tags = merge(local.conformance_pack_route53_common_tags, {
    other_checks = "true"
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

control "route53_domain_expires_30_days" {
  title       = "Route 53 domains should not expire within next 30 days"
  description = "This control ensures that all the domain names registered with AWS Route 53 or transferred to AWS Route 53 are renewed 30 days before their validity period ends."
  query       = query.route53_domain_expires_30_days

  tags = merge(local.conformance_pack_route53_common_tags, {
    other_checks = "true"
  })
}

control "route53_domain_expires_7_days" {
  title       = "Route 53 domains should not expire within next 7 days"
  description = "This controls ensures that all the domain names registered with AWS Route 53 or transferred to AWS Route 53 are renewed 7 days before their validity period ends."
  query       = query.route53_domain_expires_7_days

  tags = merge(local.conformance_pack_route53_common_tags, {
    other_checks = "true"
  })
}

control "route53_domain_not_expired" {
  title       = "Route 53 domains should not be expired"
  description = "This control identifes any expired domain names registered with AWS Route 53. When the expired domain names are not restored promptly, they will become available for others to register. Restoring on time your Route 53 expired domains will allow you to reestablish full control over their registration."
  query       = query.route53_domain_not_expired

  tags = merge(local.conformance_pack_route53_common_tags, {
    other_checks = "true"
  })
}

control "route53_domain_privacy_protection_enabled" {
  title       = "Route53 domains privacy protection should be enabled"
  description = "Ensure that your Amazon Route 53 domains have Privacy Protection feature enabled in order to hide all their contact information from WHOIS queries and reduce the amount of spam received. The feature allows you to conceal your personal phone number, email and physical address for the domain names registered and/or transferred to AWS Route 53 service."
  query       = query.route53_domain_privacy_protection_enabled

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

query "route53_domain_auto_renew_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when auto_renew then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_renew then title || ' auto renew enabled.'
        else title || ' auto renew disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_route53_domain;
  EOQ
}

query "route53_zone_query_logging_enabled" {
  sql = <<-EOQ
    select
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
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_route53_zone;
  EOQ
}

query "route53_domain_expires_30_days" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when date(expiration_date) - date(current_date) >= 30 then 'ok'
        else 'alarm'
      end as status,
        title || ' set to expire in ' || extract(day from expiration_date - current_date) || ' days.' as reason

      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_route53_domain;
  EOQ
}

query "route53_domain_expires_7_days" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when date(expiration_date) - date(current_date) >= 7 then 'ok'
        else 'alarm'
      end as status,
        title || ' set to expire in ' || extract(day from expiration_date - current_date) || ' days.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_route53_domain;
  EOQ
}

query "route53_domain_not_expired" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when expiration_date < (current_date - interval '1' minute) then 'alarm'
        else 'ok'
      end as status,
      case
        when expiration_date < (current_date - interval '1' minute) then title || ' expired on ' || to_char(expiration_date, 'DD-Mon-YYYY') || '.'
        else title || ' set to expire in ' || extract(day from expiration_date - current_date) || ' days.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_route53_domain;
  EOQ
}

query "route53_domain_privacy_protection_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when admin_privacy then 'ok'
        else 'alarm'
      end as status,
      case
        when admin_privacy then title || ' privacy protection enabled.'
        else title || ' privacy protection disabled.'
        end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_route53_domain;
  EOQ
}

query "route53_domain_transfer_lock_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when transfer_lock then 'ok'
        else 'alarm'
      end as status,
      case
        when transfer_lock then title || ' transfer lock enabled.'
        else title || ' transfer lock disabled.'
        end reason

      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_route53_domain;
  EOQ
}

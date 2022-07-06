locals {
  conformance_pack_route53_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Route53"
  })
}

control "route53_zone_query_logging_enabled" {
  title       = "Route 53 zones should have query logging enabled"
  description = "Ensure Route 53 zones have query logging enabled."
  sql         = query.route53_zone_query_logging_enabled.sql

  tags = merge(local.conformance_pack_route53_common_tags, {
    other_checks = "true"
  })
}

control "route53_domain_transfer_lock_enabled" {
  title       = "Route 53 domains should have transfer lock enabled"
  description = "Ensure Route 53 registered domains are locked to prevent any unauthorized transfers to another domain name registrar."
  sql         = query.route53_domain_transfer_lock_enabled.sql

  tags = merge(local.conformance_pack_route53_common_tags, {
    other_checks = "true"
  })
}

locals {
  conformance_pack_route53_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Route53"
  })
}

control "route53_zone_query_logging_enabled" {
  title       = "Route53 zones query logging should be enabled"
  description = "Ensure that your Route53 zones query logging is enabled."
  sql         = query.route53_zone_query_logging_enabled.sql

  tags = merge(local.conformance_pack_route53_common_tags, {
    extra_checks = "true"
  })
}

control "route53_domain_transfer_lock_enabled" {
  title       = "Route53 domain transfer lock should be enabled"
  description = "Ensure that your AWS Route 53 registered domains are locked to prevent any unauthorized transfers to another domain name registrar."
  sql         = query.route53_domain_transfer_lock_enabled.sql

  tags = merge(local.conformance_pack_route53_common_tags, {
    extra_checks = "true"
  })
}
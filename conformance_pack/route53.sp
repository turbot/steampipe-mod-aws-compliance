locals {
  conformance_pack_route53_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Route53"
  })
}

control "route53_zone_query_logging_enabled" {
  title       = "Route53 zone query logging should be enabled"
  description = "Ensure that your Route53 zone query logging is enabled."
  sql         = query.route53_zone_query_logging_enabled.sql

  tags = merge(local.conformance_pack_route53_common_tags, {
    extra_checks = "true"
  })
}
locals {
  extra_checks_route53_common_tags = merge(local.extra_checks_common_tags, {
    service = "route53"
  })
}

benchmark "group_route53" {
  title       = "Route53 Extra Checks"
  description = "This group of route53 extra checks shows results of controls related to route53 service."
  children = [
    control.route53_hosted_zone_query_logging_enabled
  ]

  tags = local.extra_checks_route53_common_tags
}

control "route53_hosted_zone_query_logging_enabled" {
  title       = "Check if Route53 public hosted zones are logging queries to CloudWatch Logs"
  description = "If logs are not enabled; monitoring of service use and threat analysis is not possible. Enable CloudWatch logs and define metrics and uses cases for the events recorded."
  sql         = query.route53_hosted_zone_query_logging_enabled.sql

  tags = merge(local.extra_checks_route53_common_tags, {
    extra_check_category = "logging_and_monitoring"
  })
}

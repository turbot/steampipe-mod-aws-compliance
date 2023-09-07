locals {
  all_controls_route53_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Route53"
  })
}

benchmark "all_controls_route53" {
  title       = "Route 53"
  description = "This section contains recommendations for configuring Route 53 resources."
  children = [
    control.route53_domain_auto_renew_enabled,
    control.route53_domain_expires_30_days,
    control.route53_domain_expires_7_days,
    control.route53_domain_not_expired,
    control.route53_domain_privacy_protection_enabled,
    control.route53_domain_transfer_lock_enabled,
    control.route53_zone_query_logging_enabled
  ]

  tags = merge(local.all_controls_route53_common_tags, {
    type = "Benchmark"
  })
}

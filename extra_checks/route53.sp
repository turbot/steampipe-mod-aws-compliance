locals {
  extra_checks_route53_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_route53" {
  title       = "Route53 Extra Checks"
  description = "TODO"
  children = [
    control.route53_zone_query_logging_enabled
  ]

  tags = local.extra_checks_route53_common_tags
}

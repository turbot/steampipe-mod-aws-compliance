locals {
  extra_checks_route53_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_route53" {
  title       = "Route53"
  description = "This benchmark contains additional checks for AWS Route53 service, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.route53_domain_transfer_lock_enabled,
    control.route53_zone_query_logging_enabled
  ]

  tags = local.extra_checks_route53_common_tags
}

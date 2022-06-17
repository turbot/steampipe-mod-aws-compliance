locals {
  extra_checks_acm_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_acm" {
  title       = "ACM Extra Checks"
  description = "TODO"
  children = [
    control.acm_certificate_transparency_logging_enabled
  ]

  tags = local.extra_checks_acm_common_tags
}

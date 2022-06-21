locals {
  extra_checks_acm_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_acm" {
  title       = "ACM"
  description = "This benchmark contains additional checks for AWS ACM servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.acm_certificate_transparency_logging_enabled
  ]

  tags = local.extra_checks_acm_common_tags
}

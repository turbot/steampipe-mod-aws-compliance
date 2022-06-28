locals {
  extra_checks_securityhub_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_securityhub" {
  title       = "SecurityHub"
  description = "This benchmark contains additional checks for AWS SecurityHub service, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.securityhub_standards_subscription_enabled
  ]

  tags = local.extra_checks_securityhub_common_tags
}

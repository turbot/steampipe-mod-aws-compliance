locals {
  all_controls_securityhub_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/SecurityHub"
  })
}

benchmark "all_controls_securityhub" {
  title       = "Security Hub"
  description = "This section contains recommendations for configuring Security Hub resources."
  children = [
    control.securityhub_enabled
  ]

  tags = merge(local.all_controls_securityhub_common_tags, {
    type = "Benchmark"
  })
}

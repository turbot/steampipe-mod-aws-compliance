locals {
  all_controls_securityhub_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/SecurityHub"
  })
}

benchmark "all_controls_securityhub" {
  title       = "SecurityHub"
  description = "This section contains recommendations for configuring SecurityHub resources."
  children = [
    control.securityhub_enabled
  ]

  tags = merge(local.all_controls_securityhub_common_tags, {
    type = "Benchmark"
  })
}

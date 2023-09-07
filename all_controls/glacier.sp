locals {
  all_controls_glacier_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Glacier"
  })
}

benchmark "all_controls_glacier" {
  title       = "Glacier"
  description = "This section contains recommendations for configuring Glacier resources."
  children = [
    control.glacier_vault_restrict_public_access
  ]

  tags = merge(local.all_controls_glacier_common_tags, {
    type = "Benchmark"
  })
}

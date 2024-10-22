locals {
  all_controls_msk_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/MSK"
  })
}

benchmark "all_controls_msk" {
  title       = "MSK"
  description = "This section contains recommendations for configuring MSK resources."
  children = [
    control.msk_cluster_encryption_in_transit_with_tls_enabled
  ]

  tags = merge(local.all_controls_msk_common_tags, {
    type = "Benchmark"
  })
}
locals {
  all_controls_dax_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/DAX"
  })
}

benchmark "all_controls_dax" {
  title       = "DAX"
  description = "This section contains recommendations for configuring DAX resources."
  children = [
    control.dax_cluster_encryption_at_rest_enabled,
    control.dax_cluster_encryption_in_transit_enabled
  ]

  tags = merge(local.all_controls_dax_common_tags, {
    type = "Benchmark"
  })
}

locals {
  all_controls_msk_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/MSK"
  })
}

benchmark "all_controls_msk" {
  title       = "MSK"
  description = "This section contains recommendations for configuring MSK resources."
  children = [
    control.msk_cluster_encryption_in_transit_with_tls_enabled,
    control.msk_cluster_not_publicly_accessible,
    control.msk_cluster_unauthenticated_access_disabled,
    control.mskconnect_connector_encryption_in_transit_with_tls_enabled,
    control.mskconnect_connector_logging_enabled
  ]

  tags = merge(local.all_controls_msk_common_tags, {
    type = "Benchmark"
  })
}
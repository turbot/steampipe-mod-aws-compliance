locals {
  all_controls_docdb_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/DocumentDB"
  })
}

benchmark "all_controls_docdb" {
  title       = "DocumentDB"
  description = "This section contains recommendations for configuring DocumentDB resources."
  children = [
    control.docdb_cluster_backup_retention_period_7_days,
    control.docdb_cluster_deletion_protection_enabled,
    control.docdb_cluster_encryption_at_rest_enabled,
    control.docdb_cluster_encryption_in_transit_enabled,
    control.docdb_cluster_instance_encryption_at_rest_enabled,
    control.docdb_cluster_instance_logging_enabled,
    control.docdb_cluster_snapshot_restrict_public_access
  ]

  tags = merge(local.all_controls_docdb_common_tags, {
    type = "Benchmark"
  })
}

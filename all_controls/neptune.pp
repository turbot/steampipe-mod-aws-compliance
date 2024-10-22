locals {
  all_controls_neptune_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Neptune"
  })
}

benchmark "all_controls_neptune" {
  title       = "Neptune"
  description = "This section contains recommendations for configuring Neptune resources."
  children = [
    control.neptune_db_cluster_audit_logging_enabled,
    control.neptune_db_cluster_automated_backup_enabled,
    control.neptune_db_cluster_copy_tags_to_snapshot_enabled,
    control.neptune_db_cluster_deletion_protection_enabled,
    control.neptune_db_cluster_encryption_at_rest_enabled,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.neptune_db_cluster_no_public_subnet,
    control.neptune_db_cluster_snapshot_encryption_at_rest_enabled,
    control.neptune_db_cluster_snapshot_prohibit_public_access
  ]

  tags = merge(local.all_controls_neptune_common_tags, {
    type = "Benchmark"
  })
}

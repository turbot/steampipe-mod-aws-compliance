locals {
  all_controls_ebs_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/EBS"
  })
}

benchmark "all_controls_ebs" {
  title       = "EBS"
  description = "This section contains recommendations for configuring EBS resources."
  children = [
    control.ebs_attached_volume_delete_on_termination_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.ebs_snapshot_encryption_enabled,
    control.ebs_snapshot_not_publicly_restorable,
    control.ebs_volume_encryption_at_rest_enabled,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ebs_volume_snapshot_exists,
    control.ebs_volume_unused
  ]

  tags = merge(local.all_controls_ebs_common_tags, {
    type = "Benchmark"
  })
}

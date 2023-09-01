locals {
  all_controls_backup_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Backup"
  })
}

benchmark "all_controls_backup" {
  title       = "Backup"
  description = "This section contains recommendations for configuring Backup resources."
  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_plan_region_configured,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.backup_report_plan_configured,
    control.backup_vault_region_configured
  ]

  tags = merge(local.all_controls_backup_common_tags, {
    type = "Benchmark"
  })
}

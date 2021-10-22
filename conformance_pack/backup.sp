locals {
  conformance_pack_backup_common_tags = {
    service = "backup"
  }
}

control "backup_recovery_point_manual_deletion_disabled" {
  title       = "Backup recovery point manual deletion should be disabled"
  description = "Checks if a backup vault has an attached resource-based policy which prevents deletion of recovery points. The rule is non complaint if the Backup Vault does not have resource-based policies or has policies without a suitable 'Deny' statement."
  sql         = query.backup_recovery_point_manual_deletion_disabled.sql

  tags = merge(local.conformance_pack_backup_common_tags, {
    soc_2 = "true"
  })
}
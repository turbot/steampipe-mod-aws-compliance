locals {
  foundational_security_backup_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Backup"
  })
}

benchmark "foundational_security_backup" {
  title         = "Backup"
  documentation = file("./foundational_security/docs/foundational_security_backup.md")
  children = [
    control.foundational_security_backup_1
  ]

  tags = merge(local.foundational_security_backup_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_backup_1" {
  title         = "1 AWS Backup recovery points should be encrypted at rest"
  description   = "This control checks if an AWS Backup recovery point is encrypted at rest. The control fails if the recovery point isn't encrypted at rest."
  severity      = "medium"
  query         = query.backup_recovery_point_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_backup_1.md")

  tags = merge(local.foundational_security_backup_common_tags, {
    foundational_security_item_id  = "backup_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}
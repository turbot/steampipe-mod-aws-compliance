locals {
  all_controls_dynamodb_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/DynamoDB"
  })
}

benchmark "all_controls_dynamodb" {
  title       = "DynamoDB"
  description = "This section contains recommendations for configuring DynamoDB resources."
  children = [
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_deletion_protection_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.dynamodb_table_encryption_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.dynamodb_table_protected_by_backup_plan
  ]

  tags = merge(local.all_controls_dynamodb_common_tags, {
    type = "Benchmark"
  })
}

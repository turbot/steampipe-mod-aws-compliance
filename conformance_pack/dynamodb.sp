locals {
  conformance_pack_dynamodb_common_tags = {
    service = "dynamodb"
  }
}

control "dynamodb_table_auto_scaling_enabled" {
  title       = "DynamoDB table auto scaling should be enabled"
  description = "Amazon DynamoDB auto scaling uses the AWS Application Auto Scaling service to adjust provisioned throughput capacity that automatically responds to actual traffic patterns."
  sql         = query.dynamodb_table_auto_scaling_enabled.sql
  tags        = local.conformance_pack_dynamodb_common_tags
}

control "dynamodb_table_point_in_time_recovery_enabled" {
  title       = "DynamoDB table point-in-time recovery should be enabled"
  description = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  sql         = query.dynamodb_table_point_in_time_recovery_enabled.sql
  tags        = local.conformance_pack_dynamodb_common_tags
}

control "dynamodb_table_encrypted_with_kms_cmk" {
  title       = "DynamoDB table should be encrypted with AWS KMS"
  description = "Ensure that encryption is enabled for your Amazon DynamoDB tables. Because sensitive data can exist at rest in these tables, enable encryption at rest to help protect that data."
  sql         = query.dynamodb_table_encrypted_with_kms_cmk.sql
  tags        = local.conformance_pack_dynamodb_common_tags
}

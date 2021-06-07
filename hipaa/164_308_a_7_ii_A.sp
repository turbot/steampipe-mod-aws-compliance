locals {
  hipaa_164_308_a_7_ii_A_common_tags = merge(local.hipaa_common_tags, {
    service = "164_308_a_7_ii_A"
  })
}

benchmark "hipaa_164_308_a_7_ii_A" {
  title         = "164_308_a_7_ii_A"
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_ii_A.md")
  children = [
    control.hipaa_164_308_a_7_ii_A_rds_db_instance_backup_enabled,
    control.hipaa_164_308_a_7_ii_A_dynamodb_table_point_in_time_recovery_enabled,
    control.hipaa_164_308_a_7_ii_A_s3_bucket_versioning_enabled,
    control.hipaa_164_308_a_7_ii_A_s3_bucket_cross_region_replication_enabled,
  ]
  tags          = local.hipaa_164_308_a_7_ii_A_common_tags
}

control "hipaa_164_308_a_7_ii_A_rds_db_instance_backup_enabled" {
  title         = "RDS db instance backup should be enabled"
  description   = "The backup feature of Amazon RDS creates backups of your databases and transaction logs."
  sql           = query.rds_db_instance_backup_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_ii_A_rds_db_instance_backup_enabled.md")

  tags = merge(local.hipaa_164_308_a_7_ii_A_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_7_ii_A_rds_db_instance_backup_enabled"
  })
}

control "hipaa_164_308_a_7_ii_A_dynamodb_table_point_in_time_recovery_enabled" {
  title         = "Dynamodb table point in time recovery should be enabled"
  description   = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  sql           = query.dynamodb_table_point_in_time_recovery_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_ii_A_dynamodb_table_point_in_time_recovery_enabled.md")

  tags = merge(local.hipaa_164_308_a_7_ii_A_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_7_ii_A_dynamodb_table_point_in_time_recovery_enabled"
  })
}

control "hipaa_164_308_a_7_ii_A_s3_bucket_versioning_enabled" {
  title         = "S3 bucket versioning should be enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) bucket versioning helps keep multiple variants of an object in the same Amazon S3 bucket."
  sql           = query.s3_bucket_versioning_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_ii_A_s3_bucket_versioning_enabled.md")

  tags = merge(local.hipaa_164_308_a_7_ii_A_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_7_ii_A_s3_bucket_versioning_enabled"
  })
}

control "hipaa_164_308_a_7_ii_A_s3_bucket_cross_region_replication_enabled" {
  title         = "S3 bucket cross region replication should be enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) Cross-Region Replication (CRR) supports maintaining adequate capacity and availability."
  sql           = query.s3_bucket_cross_region_replication_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_ii_A_s3_bucket_cross_region_replication_enabled.md")

  tags = merge(local.hipaa_164_308_a_7_ii_A_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_7_ii_A_s3_bucket_cross_region_replication_enabled"
  })
}
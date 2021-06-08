locals {
  hipaa_164_312_a_2_ii_common_tags = merge(local.hipaa_common_tags, {
    service = "164_312_a_2_ii"
  })
}

benchmark "hipaa_164_312_a_2_ii" {
  title         = "164.312(a)(2)(ii)"
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii.md")
  children = [
    control.hipaa_164_312_a_2_ii_dynamodb_table_point_in_time_recovery_enabled,
    control.hipaa_164_312_a_2_ii_rds_db_instance_backup_enabled,
    control.hipaa_164_312_a_2_ii_s3_bucket_cross_region_replication_enabled,
    control.hipaa_164_312_a_2_ii_s3_bucket_versioning_enabled
  ]
  tags          = local.hipaa_164_312_a_2_ii_common_tags
}

control "hipaa_164_312_a_2_ii_dynamodb_table_point_in_time_recovery_enabled" {
  title         = "DynamoDB table point in time recovery enabled"
  description   = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  sql           = query.dynamodb_table_point_in_time_recovery_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii_dynamodb_table_point_in_time_recovery_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_ii_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_ii_dynamodb_table_point_in_time_recovery_enabled"
  })
}

control "hipaa_164_312_a_2_ii_rds_db_instance_backup_enabled" {
  title         = "RDS db instance backup enabled"
  description   = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  sql           = query.rds_db_instance_backup_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii_rds_db_instance_backup_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_ii_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_ii_rds_db_instance_backup_enabled"
  })
}

control "hipaa_164_312_a_2_ii_s3_bucket_cross_region_replication_enabled" {
  title         = "S3 bucket cross region replication enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) Cross-Region Replication (CRR) supports maintaining adequate capacity and availability. CRR enables automatic, asynchronous copying of objects across Amazon S3 buckets to help ensure that data availability is maintained."
  sql           = query.s3_bucket_cross_region_replication_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii_s3_bucket_cross_region_replication_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_ii_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_ii_s3_bucket_cross_region_replication_enabled"
  })
}

control "hipaa_164_312_a_2_ii_s3_bucket_versioning_enabled" {
  title         = "S3 bucket versioning enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) bucket versioning helps keep multiple variants of an object in the same Amazon S3 bucket."
  sql           = query.s3_bucket_versioning_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii_s3_bucket_versioning_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_ii_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_ii_s3_bucket_versioning_enabled"
  })
}
locals {
  hipaa_164_312_a_2_ii_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_a_2_ii"
  })
}

benchmark "hipaa_164_312_a_2_ii" {
  title         = "164.312(a)(2)(ii) Emergency access procedure"
  description   = "Establish (and implement as needed) procedures for obtaining necessary electronic protected health information during an emergency."
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii.md")
  children = [
    control.hipaa_164_312_a_2_ii_dynamodb_table_point_in_time_recovery_enabled,
    control.hipaa_164_312_a_2_ii_rds_db_instance_backup_enabled,
    control.hipaa_164_312_a_2_ii_elasticache_redis_cluster_automatic_backup_enabled,
    control.hipaa_164_312_a_2_ii_s3_bucket_cross_region_replication_enabled,
    control.hipaa_164_312_a_2_ii_s3_bucket_versioning_enabled
  ]
  tags          = local.hipaa_164_312_a_2_ii_common_tags
}

control "hipaa_164_312_a_2_ii_dynamodb_table_point_in_time_recovery_enabled" {
  title         = "DynamoDB table point in time recovery should be enabled"
  description   = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  sql           = query.dynamodb_table_point_in_time_recovery_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii_dynamodb_table_point_in_time_recovery_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_ii_common_tags, {
    service  = "dynamodb"
  })
}

control "hipaa_164_312_a_2_ii_rds_db_instance_backup_enabled" {
  title         = "RDS DB instance backup should be enabled"
  description   = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  sql           = query.rds_db_instance_backup_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii_rds_db_instance_backup_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_ii_common_tags, {
    service  = "rds"
  })
}

control "hipaa_164_312_a_2_ii_elasticache_redis_cluster_automatic_backup_enabled" {
  title         = "ElastiCache Redis cluster automatic backup should be enabled"
  description   = "When automatic backups are enabled, Amazon ElastiCache creates a backup of the cluster on a daily basis. The backup can be retained for a number of days as specified by your organization. Automatic backups can help guard against data loss."
  sql           = query.elasticache_redis_cluster_automatic_backup_retention_15_days.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii_elasticache_redis_cluster_automatic_backup_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_ii_common_tags, {
    service  = "elasticache"
  })
}

control "hipaa_164_312_a_2_ii_s3_bucket_cross_region_replication_enabled" {
  title         = "S3 bucket cross region replication should be enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) Cross-Region Replication (CRR) supports maintaining adequate capacity and availability. CRR enables automatic, asynchronous copying of objects across Amazon S3 buckets to help ensure that data availability is maintained."
  sql           = query.s3_bucket_cross_region_replication_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii_s3_bucket_cross_region_replication_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_ii_common_tags, {
    service  = "s3"
  })
}

control "hipaa_164_312_a_2_ii_s3_bucket_versioning_enabled" {
  title         = "S3 bucket versioning should be enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) bucket versioning helps keep multiple variants of an object in the same Amazon S3 bucket."
  sql           = query.s3_bucket_versioning_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_ii_s3_bucket_versioning_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_ii_common_tags, {
    service  = "s3"
  })
}

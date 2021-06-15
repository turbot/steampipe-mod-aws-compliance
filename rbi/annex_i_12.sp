locals {
  rbi_annex_i_12_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_12"
  })
}

benchmark "rbi_annex_i_12" {
  title       = "Annex_I(12)"
  description = "TODO"
  children = [
    control.rbi_annex_i_12_dynamodb_table_point_in_time_recovery_enabled,
    control.rbi_annex_i_12_elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rbi_annex_i_12_rds_db_instance_backup_enabled,
    control.rbi_annex_i_12_s3_bucket_cross_region_replication_enabled,
    control.rbi_annex_i_12_s3_bucket_versioning_enabled
  ]
  tags = local.rbi_annex_i_12_common_tags
}

control "rbi_annex_i_12_rds_db_instance_backup_enabled" {
  title       = "RDS db instance backup should be enabled"
  description = "The backup feature of Amazon RDS creates backups of your databases and transaction logs."
  sql         = query.rds_db_instance_backup_enabled.sql

  tags = merge(local.rbi_annex_i_12_common_tags, {
    service = "rds"
  })
}

control "rbi_annex_i_12_dynamodb_table_point_in_time_recovery_enabled" {
  title       = "DynamoDB table point in time recovery should be enabled"
  description = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  sql         = query.dynamodb_table_point_in_time_recovery_enabled.sql

  tags = merge(local.rbi_annex_i_12_common_tags, {
    service = "dynamodb"
  })
}

control "rbi_annex_i_12_elasticache_redis_cluster_automatic_backup_retention_15_days" {
  title       = "ElastiCache Redis cluster automatic backup should be enabled with retention period of 15 days"
  description = "When automatic backups are enabled, Amazon ElastiCache creates a backup of the cluster on a daily basis. The backup can be retained for a number of days as specified by your organization. Automatic backups can help guard against data loss."
  sql         = query.elasticache_redis_cluster_automatic_backup_retention_15_days.sql

  tags = merge(local.rbi_annex_i_12_common_tags, {
    service = "elasticache"
  })
}

control "rbi_annex_i_12_s3_bucket_cross_region_replication_enabled" {
  title       = "S3 bucket cross region replication enabled"
  description = "Amazon Simple Storage Service (Amazon S3) Cross-Region Replication (CRR) supports maintaining adequate capacity and availability."
  sql         = query.s3_bucket_cross_region_replication_enabled.sql

  tags = merge(local.rbi_annex_i_12_common_tags, {
    service = "s3"
  })
}

control "rbi_annex_i_12_s3_bucket_versioning_enabled" {
  title       = "S3 bucket versioning should be enabled"
  description = "Amazon Simple Storage Service (Amazon S3) bucket versioning helps keep multiple variants of an object in the same Amazon S3 bucket."
  sql         = query.s3_bucket_versioning_enabled.sql

  tags = merge(local.rbi_annex_i_12_common_tags, {
    service = "s3"
  })
}
locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_7_ii_a"
  })
}

benchmark "hipaa_164_308_a_7_ii_a" {
  title       = "164.308(a)(7)(ii)(A) Data backup plan"
  description = "Establish and implement procedures to create and maintain retrievable exact copies of electronic protected health information."
  children = [
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
  ]
  tags          = local.common_tags
}
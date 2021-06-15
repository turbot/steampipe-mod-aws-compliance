locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_a_2_ii"
  })
}

benchmark "hipaa_164_312_a_2_ii" {
  title       = "164.312(a)(2)(ii) Emergency access procedure"
  description = "Establish (and implement as needed) procedures for obtaining necessary electronic protected health information during an emergency."
  children = [
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]
  tags          = local.common_tags
}
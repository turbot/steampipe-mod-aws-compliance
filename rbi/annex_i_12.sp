locals {
  rbi_annex_i_12_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_12"
  })
}

benchmark "rbi_annex_i_12" {
  title       = "Annex_I(12)"
  description = "TODO"
  children = [
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]
  tags = local.rbi_annex_i_12_common_tags
}
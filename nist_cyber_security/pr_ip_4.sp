benchmark "nist_cyber_security_pr_ip_4" {
  title       = "PR.IP-4"
  description = "Configuration change control processes are in place."

  children = [
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ip_3"
  })
}
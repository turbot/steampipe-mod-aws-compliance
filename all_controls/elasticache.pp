locals {
  all_controls_elasticache_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/ElastiCache"
  })
}

benchmark "all_controls_elasticache" {
  title       = "ElastiCache"
  description = "This section contains recommendations for configuring ElastiCache resources."
  children = [
    control.elasticache_cluster_auto_minor_version_upgrade_enabled,
    control.elasticache_cluster_no_default_subnet_group,
    control.elasticache_cluster_no_public_subnet,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elasticache_replication_group_auto_failover_enabled,
    control.elasticache_replication_group_encryption_at_rest_enabled,
    control.elasticache_replication_group_encryption_at_rest_enabled_with_kms_cmk,
    control.elasticache_replication_group_encryption_in_transit_enabled,
    control.elasticache_replication_group_redis_auth_enabled
  ]

  tags = merge(local.all_controls_elasticache_common_tags, {
    type = "Benchmark"
  })
}

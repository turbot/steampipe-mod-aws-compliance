locals {
  conformance_pack_elasticache_common_tags = {
    service = "elasticache"
  }
}

control "elasticache_redis_cluster_automatic_backup_retention_15_days" {
  title       = "ElastiCache Redis cluster automatic backup should be enabled with retention period of 15 days"
  description = "When automatic backups are enabled, Amazon ElastiCache creates a backup of the cluster on a daily basis. The backup can be retained for a number of days as specified by your organization. Automatic backups can help guard against data loss."
  sql         = query.elasticache_redis_cluster_automatic_backup_retention_15_days.sql
  tags        = local.conformance_pack_elasticache_common_tags
}
locals {
  foundational_security_elasticache_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/ElastiCache"
  })
}

benchmark "foundational_security_elasticache" {
  title         = "ElastiCache"
  documentation = file("./foundational_security/docs/foundational_security_elasticache.md")
  children = [
    control.foundational_security_elasticache_1,
    control.foundational_security_elasticache_2,
    control.foundational_security_elasticache_3,
    control.foundational_security_elasticache_4,
    control.foundational_security_elasticache_5,
    control.foundational_security_elasticache_6,
    control.foundational_security_elasticache_7
  ]

  tags = merge(local.foundational_security_elasticache_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_elasticache_1" {
  title         = "1 ElastiCache for Redis clusters should have automatic backups scheduled"
  description   = "This control evaluates if Amazon ElastiCache for Redis clusters have automatic backup scheduled. The control fails if the SnapshotRetentionLimit for the Redis cluster is less than 1."
  severity      = "high"
  query         = query.elasticache_redis_cluster_automatic_backup_retention_15_days
  documentation = file("./foundational_security/docs/foundational_security_elasticache_1.md")

  tags = merge(local.foundational_security_elasticache_common_tags, {
    foundational_security_item_id  = "elasticache_1"
    foundational_security_category = "backups_enabled"
  })
}

control "foundational_security_elasticache_2" {
  title         = "2 Minor version upgrades should be automatically applied to ElastiCache for Redis cache clusters"
  description   = "This control evaluates whether ElastiCache for Redis automatically applies minor version upgrades to cache clusters. This control fails if ElastiCache for Redis cache clusters do not have minor version upgrades automatically applied."
  severity      = "high"
  query         = query.elasticache_cluster_auto_minor_version_upgrade_enabled
  documentation = file("./foundational_security/docs/foundational_security_elasticache_2.md")

  tags = merge(local.foundational_security_elasticache_common_tags, {
    foundational_security_item_id  = "elasticache_2"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}

control "foundational_security_elasticache_3" {
  title         = "3 ElastiCache for Redis replication groups should have automatic failover enabled"
  description   = "This control checks if ElastiCache for Redis replication groups have automatic failover enabled. This control fails if automatic failover isn't enabled for a Redis replication group."
  severity      = "medium"
  query         = query.elasticache_replication_group_auto_failover_enabled
  documentation = file("./foundational_security/docs/foundational_security_elasticache_3.md")

  tags = merge(local.foundational_security_elasticache_common_tags, {
    foundational_security_item_id  = "elasticache_3"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_elasticache_4" {
  title         = "4 ElastiCache for Redis replication groups should be encrypted at rest"
  description   = "This control checks if ElastiCache for Redis replication groups are encrypted at rest. This control fails if an ElastiCache for Redis replication group isn't encrypted at rest."
  severity      = "medium"
  query         = query.elasticache_replication_group_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_elasticache_4.md")

  tags = merge(local.foundational_security_elasticache_common_tags, {
    foundational_security_item_id  = "elasticache_4"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_elasticache_5" {
  title         = "5 ElastiCache for Redis replication groups should be encrypted in transit"
  description   = "This control checks if ElastiCache for Redis replication groups are encrypted in transit. This control fails if an ElastiCache for Redis replication group isn't encrypted in transit."
  severity      = "medium"
  query         = query.elasticache_replication_group_encryption_in_transit_enabled
  documentation = file("./foundational_security/docs/foundational_security_elasticache_5.md")

  tags = merge(local.foundational_security_elasticache_common_tags, {
    foundational_security_item_id  = "elasticache_5"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_elasticache_6" {
  title         = "6 ElastiCache for Redis replication groups before version 6.0 should use Redis AUTH"
  description   = "This control checks if ElastiCache for Redis replication groups have Redis AUTH enabled. The control fails for an ElastiCache for Redis replication group if the Redis version of its nodes is below 6.0 and AuthToken isn't in use."
  severity      = "medium"
  query         = query.elasticache_replication_group_redis_auth_enabled
  documentation = file("./foundational_security/docs/foundational_security_elasticache_6.md")

  tags = merge(local.foundational_security_elasticache_common_tags, {
    foundational_security_item_id  = "elasticache_6"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_elasticache_7" {
  title         = "7 ElastiCache clusters should not use the default subnet group"
  description   = "This control checks if ElastiCache clusters are configured with a custom subnet group. The control fails for an ElastiCache cluster if CacheSubnetGroupName has the value default."
  severity      = "high"
  query         = query.elasticache_cluster_no_default_subnet_group
  documentation = file("./foundational_security/docs/foundational_security_elasticache_7.md")

  tags = merge(local.foundational_security_elasticache_common_tags, {
    foundational_security_item_id  = "elasticache_7"
    foundational_security_category = "secure_network_configuration"
  })
}

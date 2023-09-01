locals {
  conformance_pack_elasticache_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ElastiCache"
  })
}

control "elasticache_cluster_auto_minor_version_upgrade_enabled" {
  title       = "Minor version upgrades should be automatically applied to ElastiCache for Redis cache clusters"
  description = "This control evaluates whether ElastiCache for Redis automatically applies minor version upgrades to cache clusters. This control fails if ElastiCache for Redis cache clusters do not have minor version upgrades automatically applied."
  query       = query.elasticache_cluster_auto_minor_version_upgrade_enabled

  tags = local.conformance_pack_elasticache_common_tags
}

control "elasticache_replication_group_auto_failover_enabled" {
  title       = "ElastiCache for Redis replication groups should have automatic failover enabled"
  description = "This control checks if ElastiCache for Redis replication groups have automatic failover enabled. This control fails if automatic failover isn't enabled for a Redis replication group."
  query       = query.elasticache_replication_group_auto_failover_enabled

  tags = local.conformance_pack_elasticache_common_tags
}

control "elasticache_replication_group_encryption_at_rest_enabled" {
  title       = "ElastiCache for Redis replication groups should be encrypted at rest"
  description = "This control checks if ElastiCache for Redis replication groups are encrypted at rest. This control fails if an ElastiCache for Redis replication group isn't encrypted at rest."
  query       = query.elasticache_replication_group_encryption_at_rest_enabled

  tags = local.conformance_pack_elasticache_common_tags
}

control "elasticache_replication_group_encryption_in_transit_enabled" {
  title       = "ElastiCache for Redis replication groups should be encrypted in transit"
  description = "This control checks if ElastiCache for Redis replication groups are encrypted in transit. This control fails if an ElastiCache for Redis replication group isn't encrypted in transit."
  query       = query.elasticache_replication_group_encryption_in_transit_enabled

  tags = local.conformance_pack_elasticache_common_tags
}

control "elasticache_replication_group_redis_auth_enabled" {
  title       = "ElastiCache for Redis replication groups before version 6.0 should use Redis AUTH"
  description = "This control checks if ElastiCache for Redis replication groups have Redis AUTH enabled. The control fails for an ElastiCache for Redis replication group if the Redis version of its nodes is below 6.0 and AuthToken isn't in use."
  query       = query.elasticache_replication_group_redis_auth_enabled

  tags = local.conformance_pack_elasticache_common_tags
}

control "elasticache_cluster_no_default_subnet_group" {
  title       = "ElastiCache clusters should not use the default subnet group"
  description = "This control checks if ElastiCache clusters are configured with a custom subnet group. The control fails for an ElastiCache cluster if CacheSubnetGroupName has the value default."
  query       = query.elasticache_cluster_no_default_subnet_group

  tags = local.conformance_pack_elasticache_common_tags
}

control "elasticache_redis_cluster_automatic_backup_retention_15_days" {
  title       = "ElastiCache Redis cluster automatic backup should be enabled with retention period of 15 days or greater"
  description = "When automatic backups are enabled, Amazon ElastiCache creates a backup of the cluster on a daily basis. The backup can be retained for a number of days as specified by your organization. Automatic backups can help guard against data loss."
  query       = query.elasticache_redis_cluster_automatic_backup_retention_15_days

  tags = merge(local.conformance_pack_elasticache_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

query "elasticache_redis_cluster_automatic_backup_retention_15_days" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when snapshot_retention_limit < 15 then 'alarm'
        else 'ok'
      end as status,
      case
        when snapshot_retention_limit = 0 then title || ' automatic backups not enabled.'
        when snapshot_retention_limit < 15 then title || ' automatic backup retention period is less than 15 days.'
        else title || ' automatic backup retention period is more than 15 days.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_elasticache_replication_group;
  EOQ
}

query "elasticache_cluster_no_default_subnet_group" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when cache_subnet_group_name = 'default' then 'alarm'
        else 'ok'
      end as status,
      case
        when cache_subnet_group_name = 'default' then title || ' not configured with a custom subnet group.'
        else title || ' configured with a custom subnet group.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticache_cluster;
  EOQ
}

query "elasticache_replication_group_redis_auth_enabled" {
  sql = <<-EOQ
    with elasticache_cluster_node_version as (
      select
        distinct replication_group_id,
        engine_version
      from
        aws_elasticache_cluster
    )
    select
      arn as resource,
      case
        when regexp_split_to_array(v.engine_version, '\.')::int[] >= regexp_split_to_array('6.0', '\.')::int[] then 'skip'
        when regexp_split_to_array(v.engine_version, '\.')::int[] < regexp_split_to_array('6.0', '\.')::int[] and eg.auth_token_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when regexp_split_to_array(v.engine_version, '\.')::int[] >= regexp_split_to_array('6.0', '\.')::int[] then eg.title || ' node version is ' || engine_version || '.'
        when regexp_split_to_array(v.engine_version, '\.')::int[] < regexp_split_to_array('6.0', '\.')::int[] and eg.auth_token_enabled then eg.title || ' has Redis AUTH enabled.'
        else eg.title || ' has Redis AUTH disabled.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "eg.")}
    from
      aws_elasticache_replication_group as eg
      left join elasticache_cluster_node_version as v on eg.replication_group_id = v.replication_group_id;
  EOQ
}

query "elasticache_replication_group_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when at_rest_encryption_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when at_rest_encryption_enabled then title || ' encryption at rest enabled.'
        else title || ' encryption at rest disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_elasticache_replication_group;
  EOQ
}

query "elasticache_replication_group_encryption_in_transit_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when transit_encryption_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when transit_encryption_enabled then title || ' encryption in transit enabled.'
        else title || ' encryption in transit disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_elasticache_replication_group;
  EOQ
}

query "elasticache_replication_group_auto_failover_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when automatic_failover = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when automatic_failover = 'enabled' then title || ' automatic failover enabled.'
        else title || ' automatic failover disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_elasticache_replication_group;
  EOQ
}

query "elasticache_cluster_auto_minor_version_upgrade_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when auto_minor_version_upgrade then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_minor_version_upgrade then title || ' automatic minor version upgrades enabled.'
        else title || ' automatic minor version upgrades disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elasticache_cluster;
  EOQ
}
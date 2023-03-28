locals {
  conformance_pack_elasticache_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ElastiCache"
  })
}

control "elasticache_redis_cluster_automatic_backup_retention_15_days" {
  title       = "ElastiCache Redis cluster automatic backup should be enabled with retention period of 15 days or greater"
  description = "When automatic backups are enabled, Amazon ElastiCache creates a backup of the cluster on a daily basis. The backup can be retained for a number of days as specified by your organization. Automatic backups can help guard against data loss."
  query       = query.elasticache_redis_cluster_automatic_backup_retention_15_days

  tags = merge(local.conformance_pack_elasticache_common_tags, {
    pci_dss_v321           = "true"
    cis_controls_v8_ig1    = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    gxp_eu_annex_11        = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
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

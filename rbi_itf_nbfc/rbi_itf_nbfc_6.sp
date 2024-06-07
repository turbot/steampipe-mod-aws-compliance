benchmark "rbi_itf_nbfc_6" {
  title       = "6. Business Continuity Planning (BCP) and Disaster Recovery"
  description = "BCP forms a significant part of an organisation's overall Business Continuity Management plan, which includes policies, standards and procedures to ensure continuity, resumption and recovery of critical business processes. BCP shall be designed to minimise the operational, financial, legal, reputational and other material consequences arising from a disaster. NBFC should adopt a Board approved BCP Policy. The functioning of BCP shall be monitored by the Board by way of periodic reports. The CIO shall be responsible for formulation, review and monitoring of BCP to ensure continued effectiveness."

  children = [
    benchmark.rbi_itf_nbfc_6_3
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "6"
  })
}

benchmark "rbi_itf_nbfc_6_3" {
  title      = "6.3 Backup and Recovery"
  description = "NBFCs shall consider the need to put in place necessary backup sites for their critical business systems and Data centers."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.fsx_file_system_protected_by_backup_plan,
    control.kms_cmk_rotation_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "6.3"
  })
}

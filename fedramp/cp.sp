benchmark "fedramp_cp" {
  title       = benchmark.nist_800_53_rev_4_cp.title
  description = benchmark.nist_800_53_rev_4_cp.description
  children = [
    benchmark.fedramp_cp_9,
    benchmark.fedramp_cp_10
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_cp_9" {
  title       = benchmark.nist_800_53_rev_4_cp_9.title
  description = benchmark.nist_800_53_rev_4_cp_9.description
  children = [
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.backup_plan_min_retention_35_days,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.rds_db_instance_backup_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    benchmark.fedramp_cp_9_b
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "low"
  })
}

benchmark "fedramp_cp_9_b" {
  title       = "CP-9(b)"
  description = "The organization: b. Conducts backups of system-level information contained in the information system (daily incremental; weekly full)."
  children = [
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.backup_plan_min_retention_35_days,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.rds_db_instance_backup_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_cp_10" {
  title       = benchmark.nist_800_53_rev_4_cp_10.title
  description = benchmark.nist_800_53_rev_4_cp_10.description
  children = [
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.backup_plan_min_retention_35_days,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.rds_db_instance_backup_enabled,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ec2_instance_ebs_optimized,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "low"
  })
}
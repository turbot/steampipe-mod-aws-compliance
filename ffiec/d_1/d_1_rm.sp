benchmark "d_1_rm" {
  title       = "Risk Management"
  description = "Risk Management includes a risk management program, risk assessment process, and audit function to effectively manage risk and assess the effectiveness of key controls."
  children = [
    benchmark.d_1_rm_rm_b_1,
    benchmark.d_1_rm_ra_b_2,
  ]

  tags = local.d_1_common_tags
}

benchmark "d_1_rm_rm_b_1" {
  title       = "D1.RM.Rm.B.1"
  description = "An information security and business continuity risk management function(s) exists within the institution."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.s3_bucket_cross_region_replication_enabled,
    control.rds_db_instance_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.dynamodb_table_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_manual_deletion_disabled,
    # control.backup-recovery-point-minimum-retention-check ??
    control.ec2_instance_protected_by_backup_plan,
    # control.redshift_cluster_automatic_snapshots_min_7_days, ??
  ]

  tags = merge(local.d_1_common_tags, {
    ffiec_item_id = "d_1_rm_rm_b_1"
  })
}

benchmark "d_1_rm_ra_b_2" {
  title       = "D1.RM.RA.B.2"
  description = "The risk assessment identifies Internet- based systems and high-risk transactions that warrant additional authentication controls."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.d_1_common_tags, {
    ffiec_item_id = "d_1_rm_ra_b_2"
  })
}

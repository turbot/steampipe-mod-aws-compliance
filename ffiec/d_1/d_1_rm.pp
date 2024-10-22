benchmark "ffiec_d_1_rm" {
  title       = "Risk Management (RM)"
  description = "Risk Management includes a risk management program, risk assessment process, and audit function to effectively manage risk and assess the effectiveness of key controls."
  children = [
    benchmark.ffiec_d_1_rm_ra_b_2,
    benchmark.ffiec_d_1_rm_rm_b_1
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_1_rm_ra_b_2" {
  title       = "D1.RM.RA.B.2"
  description = "The risk assessment identifies Internet- based systems and high-risk transactions that warrant additional authentication controls."
  children = [
    control.guardduty_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_1_rm_rm_b_1" {
  title = "D1.RM.Rm.B.1"
  # Note: The Control ID according to [AWS Documentation](https://docs.aws.amazon.com/config/latest/developerguide/operational-best-practices-for-ffiec.html) is "D1.G.RM.Rm.1". 
  # We think that is wrong and it should be "D1.RM.Rm.B.1". 
  # Please refer to https://github.com/awsdocs/aws-config-developer-guide/issues/21 for more details.
  description = "An information security and business continuity risk management function(s) exists within the institution."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_multiple_az_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled
  ]

  tags = local.ffiec_common_tags
}

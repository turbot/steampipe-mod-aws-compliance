benchmark "ffiec_d_5_ir" {
  title       = "Incident Resilience Planning & Strategy (IR)"
  description = "Incident Resilience Planning & Strategy incorporates resilience planning and testing into existing business continuity and disaster recovery plans to minimize service disruptions and the destruction or corruption of data."
  children = [
    benchmark.ffiec_d_5_ir_pi_b_6
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_5_ir_pi_b_6" {
  title       = "D5.IR.Pl.B.6"
  description = "The institution plans to use business continuity, disaster recovery, and data backup programs to recover operations following an incident."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_protected_by_backup_plan,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.ffiec_common_tags
}

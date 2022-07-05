benchmark "gxp_21_cfr_part_11_11_10" {
  title       = "Controls for closed systems"
  description = "Persons who use closed systems to create, modify, maintain, or transmit electronic records shall employ procedures and controls designed to ensure the authenticity, integrity, and, when appropriate, the confidentiality of electronic records, and to ensure that the signer cannot readily repudiate the signed record as not genuine. Such procedures and controls shall include the following benchmarks"
  children = [
    benchmark.gxp_21_cfr_part_11_11_10_a,
  ]

  tags = local.gxp_21_cfr_part_11_common_tags
}

benchmark "gxp_21_cfr_part_11_11_10_a" {
  title       = "11.10(a)"
  description = "Persons who use closed systems to create, modify, maintain, or transmit electronic records shall employ procedures and controls designed to ensure the authenticity, integrity, and, when appropriate, the confidentiality of electronic records, and to ensure that the signer cannot readily repudiate the signed record as not genuine. Such procedures and controls shall include the following: (a) Validation of systems to ensure accuracy, reliability, consistent intended performance, and the ability to discern invalid or altered records."
  children = [
    control.s3_bucket_versioning_enabled,
    control.s3_bucket_object_lock_enabled,
    control.cloudtrail_trail_validation_enabled,
    control.rds_db_instance_backup_enabled,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_deletion_protection_enabled,    
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.vpc_vpn_tunnel_up,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.ec2_stopped_instance_30_days,
    control.ebs_volume_unused,
    control.redshift_cluster_automatic_snapshots_min_7_days
  ]

  tags = local.gxp_21_cfr_part_11_common_tags
}

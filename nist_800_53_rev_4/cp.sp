benchmark "nist_800_53_rev_4_cp" {
  title       = "Contingency Planning (CP)"
  description = "The CP control family includes controls specific to an organization's contingency plan if a cybersecurity event should occur. This includes controls like contingency plan testing, updating, training, and backups, and system reconstitution."
  children = [
    benchmark.nist_800_53_rev_4_cp_9,
    benchmark.nist_800_53_rev_4_cp_10,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_cp_9" {
  title       = "CP-9 Information System Backup"
  description = "The organization conducts backups of user-level information, system-level information  and information system documentation including security-related documentation contained in the information system and protects the confidentiality, integrity, and availability of backup information at storage locations."
  children = [
    benchmark.nist_800_53_rev_4_cp_9_b,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_cp_9_b" {
  title       = "CP-9(b)"
  description = "The organization: b. Conducts backups of system-level information contained in the information system [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.s3_bucket_cross_region_replication_enabled,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_cp_10" {
  title       = "CP-10 Information System Recovery And Reconstitution"
  description = "The organization provides for the recovery and reconstitution of the information system to a known state after a disruption, compromise, or failure."
  children = [
    control.dynamodb_table_auto_scaling_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_versioning_enabled,
    control.rds_db_instance_backup_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.vpc_vpn_tunnel_up,
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.rds_db_instance_in_backup_plan,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}
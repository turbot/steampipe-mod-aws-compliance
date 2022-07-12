benchmark "cisa_cyber_essentials_booting_up_things_to_do_first" {
  title       = "Booting Up: Things to Do First"
  description = "Even before your organization has begun to adopt a Culture of Cyber Readiness, there are things you can begin doing today to make your organization more prepared against cyber risks."
  children = [
    benchmark.cisa_cyber_essentials_booting_up_things_to_do_first_1,
    benchmark.cisa_cyber_essentials_booting_up_things_to_do_first_2,
    benchmark.cisa_cyber_essentials_booting_up_things_to_do_first_3
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_booting_up_things_to_do_first_1" {
  title       = "Booting Up: Things to Do First-1"
  description = "Employ a backup solution that automatically and continuously backs up critical data and system configurations."
  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_booting_up_things_to_do_first_2" {
  title       = "Booting Up: Things to Do First-2"
  description = "Require multi-factor authentication (MFA) for accessing your systems whenever possible. MFA should be required of all users, but start with privileged, administrative, and remote access users."
  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_booting_up_things_to_do_first_3" {
  title       = "Booting Up: Things to Do First-3"
  description = "Enable automatic updates whenever possible. Replace unsupported operating systems, applications and hardware. Test and deploy patches quickly."
  children = [
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

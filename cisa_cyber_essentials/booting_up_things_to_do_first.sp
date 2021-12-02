locals {
  cisa_cyber_essentials_booting_up_things_to_do_first_common_tags = merge(local.cisa_cyber_essentials_common_tags, {
    section = "your_surroundings"
  })
}

benchmark "cisa_cyber_essentials_booting_up_things_to_do_first" {
  title       = "Booting Up: Things to Do First"
  description = "to do"
  children = [
    benchmark.cisa_cyber_essentials_booting_up_things_to_do_first_1,
    benchmark.cisa_cyber_essentials_booting_up_things_to_do_first_2,
    benchmark.cisa_cyber_essentials_booting_up_things_to_do_first_3,
  ]

  tags = local.cisa_cyber_essentials_booting_up_things_to_do_first_common_tags
}

benchmark "cisa_cyber_essentials_booting_up_things_to_do_first_1" {
  title       = "Booting Up: Things to Do First-1"
  description = "Lead development of an internal reporting structure to detect, communicate and contain attacks."
  children = [
    control.fsx_file_system_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.dynamodb_table_protected_by_backup_plan,
    control.backup_plan_min_retention_35_days,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.s3_bucket_versioning_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.rds_db_instance_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.efs_file_system_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.ebs_volume_in_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
  ]

  tags = merge(local.cisa_cyber_essentials_booting_up_things_to_do_first_common_tags, {
    item = "booting_up_things_to_do_first_1"
  })
}

benchmark "cisa_cyber_essentials_booting_up_things_to_do_first_2" {
  title       = "Booting Up: Things to Do First-1"
  description = "Lead development of an internal reporting structure to detect, communicate and contain attacks."
  children = [
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.cisa_cyber_essentials_booting_up_things_to_do_first_common_tags, {
    item = "booting_up_things_to_do_first_2"
  })
}

benchmark "cisa_cyber_essentials_booting_up_things_to_do_first_3" {
  title       = "Booting Up: Things to Do First-3"
  description = "Enable automatic updates whenever possible. Replace unsupported operating systems, applications and hardware. Test and deploy patches quickly."
  children = [
    control.redshift_cluster_encryption_logging_enabled,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant,
  ]

  tags = merge(local.cisa_cyber_essentials_booting_up_things_to_do_first_common_tags, {
    item = "booting_up_things_to_do_first_3"
  })
}
benchmark "gxp_eu_annex_11_project_phase" {
  title       = "Project Phase"
  description = "This section focuses combination of both human-oriented and automated process that leverages documentation validation and reports for good manufacturing practice (GMP) life cycle process, change control and deviations, systems inventory, user requirement specifications, quality management system, procedure for customized systems, evidence of appropriate test methods and data transfer validation (automated)."
  children = [
    benchmark.gxp_eu_annex_11_project_phase_4
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_project_phase_4" {
  title       = "4 Validation"
  description = "The second principle of Annex 11 requires manufacturers to validate the application and qualify the system's IT infrastructure. Enhanced documentation and process evidence must be submitted, and computer system validations must be performed periodically and when migrating to another system."
  children = [
    benchmark.gxp_eu_annex_11_project_phase_4_2,
    benchmark.gxp_eu_annex_11_project_phase_4_5,
    benchmark.gxp_eu_annex_11_project_phase_4_6,
    benchmark.gxp_eu_annex_11_project_phase_4_8
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_project_phase_4_2" {
  title       = "4.2 Validation - Documentation Change Control"
  description = "Validation documentation should include change control records (if applicable) and reports on any deviations observed during the validation process."
  children = [
    control.cloudtrail_trail_enabled
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_project_phase_4_5" {
  title       = "4.5 Validation - Development Quality"
  description = "The regulated user should take all reasonable steps, to ensure that the system has been developed in accordance with an appropriate quality management system. The supplier should be assessed appropriately."
  children = [
    control.config_enabled_all_regions
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_project_phase_4_6" {
  title       = "4.6 Validation - Quality and Performance"
  description = "For the validation of bespoke or customised computerised systems there should be a process in place that ensures the formal assessment and reporting of quality and performance measures for all the life-cycle stages of the system."
  children = [
    control.config_enabled_all_regions
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_project_phase_4_8" {
  title       = "4.8 Validation - Data Transfer"
  description = "If data are transferred to another data format or system, validation should include checks that data are not altered in value and/or meaning during this migration process."
  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.ec2_instance_protected_by_backup_plan,
    control.ecr_repository_lifecycle_policy_configured,
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

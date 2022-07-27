benchmark "gxp_eu_annex_11_operational_phase" {
  title       = "Operational Phase"
  description = "This section focuses on various operational phases of data, such as data accuracy, secure storage, authorized access and backup."
  children = [
    benchmark.gxp_eu_annex_11_operational_phase_5,
    benchmark.gxp_eu_annex_11_operational_phase_7_1,
    benchmark.gxp_eu_annex_11_operational_phase_7_2,
    benchmark.gxp_eu_annex_11_operational_phase_8_2,
    benchmark.gxp_eu_annex_11_operational_phase_9,
    benchmark.gxp_eu_annex_11_operational_phase_10,
    benchmark.gxp_eu_annex_11_operational_phase_12_4,
    benchmark.gxp_eu_annex_11_operational_phase_16,
    benchmark.gxp_eu_annex_11_operational_phase_17
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_operational_phase_5" {
  title       = "5 Data"
  description = "Computerised systems exchanging data electronically with other systems should include appropriate built-in checks for the correct and secure entry and processing of data, in order to minimize the risks."
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

benchmark "gxp_eu_annex_11_operational_phase_7_1" {
  title       = "7.1 Data Storage - Damage Protection"
  description = "Data should be secured by both physical and electronic means against damage. Stored data should be checked for accessibility, readability and accuracy. Access to data should be ensured throughout the retention period."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dax_cluster_encryption_at_rest_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.dynamodb_table_encryption_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_encryption_at_rest_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_ebs_default_encryption_enabled,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_encrypt_data_at_rest,
    control.efs_file_system_in_backup_plan,
    control.eks_cluster_secrets_encrypted,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.es_domain_encryption_at_rest_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_versioning_enabled,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest
  ]

   tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_operational_phase_7_2" {
  title       = "7.2 Data Storage - Backups"
  description = "Regular back-ups of all relevant data should be done. Integrity and accuracy of backup data and the ability to restore the data should be checked during validation and monitored periodically."
  children = [
    control.rds_db_instance_backup_enabled,
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
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

   tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_operational_phase_8_2" {
  title       = "8.2 Printouts - Data Changes"
  description = "For records supporting batch release it should be possible to generate printouts indicating if any of the data has been changed since the original entry."
  children = [
    control.cloudtrail_s3_data_events_enabled
  ]

   tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_operational_phase_9" {
  title       = "9 Audit Trails"
  description = "Consideration should be given, based on a risk assessment, to building into the system the creation of a record of all GMP-relevant changes and deletions (a system generated 'audit trail'). For change or deletion of GMP-relevant data the reason should be documented. Audit trails need to be available and convertible to a generally intelligible form and regularly reviewed."
  children = [
    control.cloudtrail_s3_data_events_enabled
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_operational_phase_10" {
  title       = "10 Change and Configuration Management"
  description = "Any changes to a computerised system including system configurations should only be made in a controlled manner in accordance with a defined procedure."
  children = [
    control.config_enabled_all_regions
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_operational_phase_12_4" {
  title       = "12.4 Security - Audit Trail"
  description = "Management systems for data and for documents should be designed to record the identity of operators entering, changing, confirming or deleting data including date and time."
  children = [
    control.cloudtrail_s3_data_events_enabled
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_operational_phase_16" {
  title       = "16 Business Continuity"
  description = "For the availability of computerised systems supporting critical processes, provisions should be made to ensure continuity of support for those processes in the event of a system breakdown (e.g. a manual or alternative system). The time required to bring the alternative arrangements into use should be based on risk and appropriate for a particular system and the business process it supports. These arrangements should be adequately documented and tested."
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
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
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

benchmark "gxp_eu_annex_11_operational_phase_17" {
  title       = "17 Archiving"
  description = "Data may be archived. This data should be checked for accessibility, readability and integrity. If relevant changes are to be made to the system (e.g. computer equipment or programs), then the ability to retrieve the data should be ensured and tested."
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
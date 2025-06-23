benchmark "nist_csf_v2_rc" {
  title       = "Recover (RC)"
  description = "Assets and operations affected by a cybersecurity incident are restored."
  children = [
    benchmark.nist_csf_v2_rc_rp,
    benchmark.nist_csf_v2_rc_co
  ]
}

benchmark "nist_csf_v2_rc_rp" {
  title       = "Incident Recovery Plan Execution (RC.RP)"
  description = "Restoration activities are performed to ensure operational availability of systems and services affected by cybersecurity incidents."
  children = [
    benchmark.nist_csf_v2_rc_rp_01,
    benchmark.nist_csf_v2_rc_rp_02,
    benchmark.nist_csf_v2_rc_rp_03,
    benchmark.nist_csf_v2_rc_rp_04,
    benchmark.nist_csf_v2_rc_rp_05,
    benchmark.nist_csf_v2_rc_rp_06
  ]
}

benchmark "nist_csf_v2_rc_co" {
  title       = "Incident Recovery Communication (RC.CO)"
  description = "Restoration activities are coordinated with internal and external parties."
  children = [
    benchmark.nist_csf_v2_rc_co_03,
    benchmark.nist_csf_v2_rc_co_04
  ]
}

benchmark "nist_csf_v2_rc_rp_01" {
  title       = "The recovery portion of the incident response plan is executed once initiated from the incident response process (RC.RP-01)"
  description = "The recovery portion of the incident response plan is executed once initiated from the incident response process. Restoration activities are performed to ensure operational availability of systems and services affected by cybersecurity incidents."
  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_plan_region_configured,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.backup_report_plan_configured,
    control.backup_vault_region_configured
  ]
}

benchmark "nist_csf_v2_rc_rp_02" {
  title       = "Recovery actions are selected, scoped, prioritized, and performed (RC.RP-02)"
  description = "Recovery actions are selected, scoped, prioritized, and performed to restore operational availability of systems and services affected by cybersecurity incidents."
  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_plan_region_configured,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.backup_report_plan_configured,
    control.backup_vault_region_configured,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ebs_volume_snapshot_exists,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_cluster_deletion_protection_enabled,
    control.rds_db_cluster_multiple_az_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_protected_by_backup_plan,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled,
    control.s3_bucket_versioning_enabled
  ]
}

benchmark "nist_csf_v2_rc_rp_03" {
  title       = "The integrity of backups and other restoration assets is verified before using them for restoration (RC.RP-03)"
  description = "The integrity of backups and other restoration assets is verified before using them for restoration. This ensures that only valid, unaltered, and reliable backups are used in recovery operations."
  children = [
    control.cloudtrail_trail_validation_enabled
  ]
}

benchmark "nist_csf_v2_rc_rp_04" {
  title       = "Critical mission functions and cybersecurity risk management are considered to establish post-incident operational norms (RC.RP-04)"
  description = "Critical mission functions and cybersecurity risk management are considered to establish post-incident operational norms, ensuring resilience and continuity after a cybersecurity incident."
  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_plan_region_configured,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.backup_report_plan_configured,
    control.backup_vault_region_configured,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_cluster_deletion_protection_enabled,
    control.rds_db_cluster_multiple_az_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_protected_by_backup_plan,
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.iam_all_policy_no_service_wild_card,
    control.iam_policy_no_star_star
  ]
}

benchmark "nist_csf_v2_rc_rp_05" {
  title       = "The integrity of restored assets is verified, systems and services are restored, and normal operating status is confirmed (RC.RP-05)"
  description = "The integrity of restored assets is verified, systems and services are restored, and normal operating status is confirmed after a cybersecurity incident."
  children = [
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.cloudtrail_trail_validation_enabled,
    control.securityhub_enabled,
    control.guardduty_enabled
  ]
}

benchmark "nist_csf_v2_rc_rp_06" {
  title       = "The end of incident recovery is declared based on criteria, and incident-related documentation is completed (RC.RP-06)"
  description = "The end of incident recovery is declared based on criteria, and incident-related documentation is completed, ensuring proper closure and reporting of the recovery process."
  children = [
    control.backup_report_plan_configured,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudwatch_log_group_retention_period_365
  ]
}

benchmark "nist_csf_v2_rc_co_03" {
  title       = "Recovery activities and progress in restoring operational capabilities are communicated to designated internal and external stakeholders (RC.CO-03)"
  description = "Recovery activities and progress in restoring operational capabilities are communicated to designated internal and external stakeholders, ensuring transparency and coordination during recovery."
  children = [
    control.sns_topic_notification_delivery_status_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.cloudtrail_trail_integrated_with_logs
  ]
}

benchmark "nist_csf_v2_rc_co_04" {
  title       = "Public updates on incident recovery are shared using approved methods and messaging (RC.CO-04)"
  description = "Public updates on incident recovery are shared using approved methods and messaging, ensuring that external stakeholders are informed appropriately."
  children = [
    control.sns_topic_policy_prohibit_public_access,
    control.s3_bucket_event_notifications_enabled,
    control.s3_public_access_block_account
  ]
}

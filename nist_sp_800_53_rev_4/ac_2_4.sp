benchmark "nist_sp_800_53_rev4_ac_2_4" {
  title       = "AC-2(4) Automated Audit Actions"
  description = "The information system automatically audits account creation, modification, enabling, disabling, and removal actions, and notifies [Assignment: organization-defined personnel or roles]."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}
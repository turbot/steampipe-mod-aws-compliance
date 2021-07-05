benchmark "nist_sp_800_53_rev4_ac_2_f" {
  title       = "AC-2(f) Account Management"
  description = "Creates, enables, modifies, disables, and removes information system accounts in accordance with organization-defined procedures or conditions."
  children = [
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}
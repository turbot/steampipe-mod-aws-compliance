locals {
  all_controls_cloudtrail_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "all_controls_cloudtrail" {
  title       = "CloudTrail"
  description = "This section contains recommendations for configuring CloudTrail resources."
  children = [
    control.cloudtrail_bucket_not_public,
    control.cloudtrail_multi_region_read_write_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_multi_region_trail_integrated_with_logs,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_s3_logging_enabled,
    control.cloudtrail_s3_object_read_events_audit_enabled,
    control.cloudtrail_s3_object_write_events_audit_enabled,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_bucket_mfa_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_enabled_account,
    control.cloudtrail_trail_insight_selectors_and_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled
  ]

  tags = merge(local.all_controls_cloudtrail_common_tags, {
    type = "Benchmark"
  })
}

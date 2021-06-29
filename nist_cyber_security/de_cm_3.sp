benchmark "nist_cyber_security_de_cm_3" {
  title       = "DE.CM-3"
  description = "Personnel activity is monitored to detect potential cybersecurity events."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.s3_bucket_logging_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "de_cm_3"
  })
}
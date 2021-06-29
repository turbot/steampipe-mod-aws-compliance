benchmark "nist_cyber_security_de_ae_4" {
  title       = "DE.AE-4"
  description = "Impact of events is determined."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "de_ae_4"
  })
}
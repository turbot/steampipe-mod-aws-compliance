benchmark "nist_cyber_security_de_cm_7" {
  title       = "DE.CM-7"
  description = "Monitoring for unauthorized personnel, connections, devices, and software is performed."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "de_cm_7"
  })
}
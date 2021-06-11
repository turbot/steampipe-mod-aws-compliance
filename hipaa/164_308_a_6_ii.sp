locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_6_ii"
  })
}

benchmark "hipaa_164_308_a_6_ii" {
  title       = "164.308(a)(6)(ii) Response and reporting"
  description = "Identify and respond to suspected or known security incidents; mitigate, to the extent practicable, harmful effects of security incidents that are known to the covered entity or business associate; and document security incidents and their outcomes."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_integrated_with_logs,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.elb_application_classic_logging_enabled,
    control.guardduty_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_log_enabled
  ]
  tags          = local.common_tags
}

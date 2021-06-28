benchmark "nist_cyber_security_id_am_3" {
  title       = "ID.AM-3"
  description = "Organizational communication and data flows are mapped."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "id_am_3"
  })
}

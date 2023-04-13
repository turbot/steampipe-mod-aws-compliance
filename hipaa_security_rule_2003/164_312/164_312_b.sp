benchmark "hipaa_security_rule_2003_164_312_b" {
  title       = "164.312(b) Audit controls"
  description = "Implement hardware, software, and/or procedural mechanisms that record and examine activity in information systems that contain or use electronic protected health information."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_validation_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.hipaa_security_rule_2003_164_312_common_tags, {
    hipaa_security_rule_2003_item_id = "164_312_b"
  })
}

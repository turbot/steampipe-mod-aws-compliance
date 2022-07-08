benchmark "nist_800_171_rev_2_3_6" {
  title       = "Incident Response"
  description = "IR controls are specific to an organization’s incident response policies and procedures. This includes incident response training, testing, monitoring, reporting, and response plan."
  children = [
    benchmark.nist_800_171_rev_2_3_6_1
  ]

  tags = local.nist_800_171_rev_2_common_tags

}

benchmark "nist_800_171_rev_2_3_6_1" {
  title       = "3.6.1"
  description = "Establish an operational incident-handling capability for organizational systems that includes preparation, detection, analysis, containment, recovery, and user response activities."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_6_2" {
  title       = "3.6.2"
  description = "Track, document, and report incidents to designated officials and/or authorities both internal and external to the organization."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_171_rev_2_common_tags
}
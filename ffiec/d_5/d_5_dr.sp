benchmark "ffiec_d_5_dr" {
  title       = "Detection, Response, & Mitigation (DR)"
  description = "Detection, Response, & Mitigation refers to the steps management takes to identify, prioritize, respond to, and mitigate the effects of internal and external threats and vulnerabilities."
  children = [
    benchmark.ffiec_d_5_dr_de_b_1,
    benchmark.ffiec_d_5_dr_de_b_2,
    benchmark.ffiec_d_5_dr_de_b_3
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_5_dr_de_b_1" {
  title       = "D5.DR.De.B.1"
  description = "Alert parameters are set for detecting information security incidents that prompt mitigating actions."
  children = [
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_5_dr_de_b_2" {
  title       = "D5.DR.De.B.2"
  description = "System performance reports contain information that can be used as a risk indicator to detect information security incidents."
  children = [
    control.lambda_function_dead_letter_queue_configured
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_5_dr_de_b_3" {
  title       = "D5.DR.De.B.3"
  description = "Tools and processes are in place to detect, alert, and trigger the incident response program."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.ffiec_common_tags
}


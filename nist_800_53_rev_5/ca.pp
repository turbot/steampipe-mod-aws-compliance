benchmark "nist_800_53_rev_5_ca" {
  title       = "Assessment, Authorization, And Monitoring (CA)"
  description = "The Security Assessment and Authorization control family includes controls that supplement the execution of security assessments, authorizations, continuous monitoring, plan of actions and milestones, and system interconnections."
  children = [
    benchmark.nist_800_53_rev_5_ca_2,
    benchmark.nist_800_53_rev_5_ca_7,
    benchmark.nist_800_53_rev_5_ca_9
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ca_2" {
  title       = "Control Assessments (CA-2)"
  description = "Assess security controls to determine effectiveness and produce security reports, documentation, and graphs."
  children = [
    benchmark.nist_800_53_rev_5_ca_2_2,
    benchmark.nist_800_53_rev_5_ca_2_d
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ca_2_2" {
  title       = "CA-2(2) Specialized Assessments"
  description = "Include as part of control assessments, [Assignment: organization-defined frequency], [Selection: announced; unannounced], [Selection (one or more): in-depth monitoring; security instrumentation; automated security test cases; vulnerability scanning; malicious user testing; insider threat assessment; performance and load testing; data leakage or data loss assessment; [Assignment: organization-defined other forms of assessment]]."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudwatch_alarm_action_enabled,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ca_2_d" {
  title       = "CA-2(d)"
  description = "Assess the controls in the system and its environment of operation [Assignment: organization-defined frequency] to determine the extent to which the controls are implemented correctly, operating as intended, and producing the desired outcome with respect to meeting established security and privacy requirements."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ca_7" {
  title       = "Continuous Monitoring (CA-7)"
  description = "Continuously monitor configuration management processes. Determine security impact, environment and operational risks."
  children = [
    benchmark.nist_800_53_rev_5_ca_7_4,
    benchmark.nist_800_53_rev_5_ca_7_b,
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudwatch_alarm_action_enabled,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.guardduty_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ca_7_b" {
  title       = "CA-7(b)"
  description = "Develop a system-level continuous monitoring strategy and implement continuous monitoring in accordance with the organization-level continuous monitoring strategy that includes: b. Establishing [Assignment: organization-defined frequencies] for monitoring and [Assignment: organization-defined frequencies] for assessment of control effectiveness."
  children = [
    control.apigateway_stage_logging_enabled,
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ca_7_4" {
  title       = "CA-7(4) Risk Monitoring"
  description = "Ensure risk monitoring is an integral part of the continuous monitoring strategy that includes the following: a. Effectiveness monitoring; b. Compliance monitoring; and c. Change monitoring."
  children = [
    benchmark.nist_800_53_rev_5_ca_7_4_c
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ca_7_4_c" {
  title       = "CA-7(4)(c)"
  description = "Ensure risk monitoring is an integral part of the continuous monitoring strategy that includes the following: (c) Change monitoring."
  children = [
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_instance_deletion_protection_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ca_9" {
  title       = "Internal System Connections (CA-9)"
  description = "a. Authorize internal connections of [Assignment: organization-defined system components or classes of components] to the system; b. Document, for each internal connection, the interface characteristics, security and privacy requirements, and the nature of the information communicated; c. Terminate internal system connections after [Assignment: organization-defined conditions]; and d. Review [Assignment: organization-defined frequency] the continued need for each internal connection."
  children = [
    benchmark.nist_800_53_rev_5_ca_9_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ca_9_b" {
  title       = "CA-9(b)"
  description = "Document, for each internal connection, the interface characteristics, security and privacy requirements, and the nature of the information communicated."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}
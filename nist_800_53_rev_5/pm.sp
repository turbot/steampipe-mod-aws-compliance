benchmark "nist_800_53_rev_5_pm" {
  title       = "Program Management (PM)"
  description = "The PM control family is specific to who manages your cybersecurity program and how it operates. This includes, but is not limited to, a critical infrastructure plan, information security program plan, plan of action milestones and processes, risk management strategy, and enterprise architecture."
  children = [
    benchmark.nist_800_53_rev_5_pm_11,
    benchmark.nist_800_53_rev_5_pm_14,
    benchmark.nist_800_53_rev_5_pm_16,
    benchmark.nist_800_53_rev_5_pm_17,
    benchmark.nist_800_53_rev_5_pm_21,
    benchmark.nist_800_53_rev_5_pm_31
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_pm_11" {
  title       = "Mission And Business Process Defination (PM-11)"
  description = "a. Define organizational mission and business processes with consideration for information security and privacy and the resulting risk to organizational operations, organizational assets, individuals, other organizations, and the Nation; and b. Determine information protection and personally identifiable information processing needs arising from the defined mission and business processes; and c. Review and revise the mission and business processes [Assignment: organization-defined frequency]."
  children = [
    benchmark.nist_800_53_rev_5_pm_11_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_pm_11_b" {
  title       = "PM-11(b)"
  description = "Determine information protection and personally identifiable information processing needs arising from the defined mission and business processes."
  children = [
    control.cloudtrail_trail_validation_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_pm_14" {
  title       = "Testing, Training, And Monitoring (PM-14)"
  description = "a. Implement a process for ensuring that organizational plans for conducting security and privacy testing, training, and monitoring activities associated with organizational systems: 1. Are developed and maintained; and 2. Continue to be executed; and b. Review testing, training, and monitoring plans for consistency with the organizational risk management strategy and organization-wide priorities for risk response actions."
  children = [
    benchmark.nist_800_53_rev_5_pm_14_a_1,
    benchmark.nist_800_53_rev_5_pm_14_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_pm_14_a_1" {
  title       = "PM-14(a)(1)"
  description = "a. Implement a process for ensuring that organizational plans for conducting security and privacy testing, training, and monitoring activities associated with organizational systems: 1. Are developed and maintained."
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

benchmark "nist_800_53_rev_5_pm_14_b" {
  title       = "PM-14(b)"
  description = "Review testing, training, and monitoring plans for consistency with the organizational risk management strategy and organization-wide priorities for risk response actions."
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

benchmark "nist_800_53_rev_5_pm_16" {
  title       = "Threat Awareness Program (PM-16)"
  description = "Implement a threat awareness program that includes a cross-organization information-sharing capability for threat intelligence."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_pm_17" {
  title       = "Protecting Controlled Unclassified Information On External Systems (PM-17)"
  description = "a. Establish policy and procedures to ensure that requirements for the protection of controlled unclassified information that is processed, stored or transmitted on external systems, are implemented in accordance with applicable laws, executive orders, directives, policies, regulations, and standards; and b. Review and update the policy and procedures [Assignment: organization-defined frequency]."
  children = [
    benchmark.nist_800_53_rev_5_pm_17_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_pm_17_b" {
  title       = "PM-17(b)"
  description = "Review and update the policy and procedures [Assignment: organization-defined frequency]."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudtrail_trail_validation_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_pm_21" {
  title       = "Accounting Of Disclosures (PM-21)"
  description = "a. Develop and maintain an accurate accounting of disclosures of personally identifiable information, including: 1. Date, nature, and purpose of each disclosure; and 2. Name and address, or other contact information of the individual or organization to which the disclosure was made; b. Retain the accounting of disclosures for the length of the time the personally identifiable information is maintained or five years after the disclosure is made, whichever is longer; and c. Make the accounting of disclosures available to the individual to whom the personally identifiable information relates upon request."
  children = [
    benchmark.nist_800_53_rev_5_pm_21_b
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudWatch"
  })
}

benchmark "nist_800_53_rev_5_pm_21_b" {
  title       = "PM-21(b)"
  description = "Retain the accounting of disclosures for the length of the time the personally identifiable information is maintained or five years after the disclosure is made, whichever is longer."
  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudWatch"
  })
}

benchmark "nist_800_53_rev_5_pm_31" {
  title       = "Continuous Monitoring Strategy (PM-31)"
  description = "Develop an organization-wide continuous monitoring strategy and implement continuous monitoring programs that include: a. Establishing the following organization-wide metrics to be monitored: [Assignment: organization-defined metrics]; b. Establishing [Assignment: organization-defined frequencies] for monitoring and [Assignment: organization-defined frequencies] for assessment of control effectiveness; c. Ongoing monitoring of organizationally-defined metrics in accordance with the continuous monitoring strategy; d. Correlation and analysis of information generated by control assessments and monitoring; e. Response actions to address results of the analysis of control assessment and monitoring information; and f. Reporting the security and privacy status of organizational systems to [Assignment: organization-defined personnel or roles] [Assignment: organization-defined frequency]."
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
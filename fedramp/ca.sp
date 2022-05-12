benchmark "fedramp_ca" {
  title       =  benchmark.nist_800_53_rev_4_ca.title
  description = benchmark.nist_800_53_rev_4_ca.description
  children = [
    benchmark.fedramp_ca_7
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_ca_7" {
  title       =  benchmark.nist_800_53_rev_4_ca_7.title
  description = benchmark.nist_800_53_rev_4_ca_7.description
  children = [
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_dead_letter_queue_configured,
    control.cloudtrail_multi_region_trail_enabled,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.securityhub_enabled,
    control.autoscaling_group_with_lb_use_health_check,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.guardduty_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    benchmark.fedramp_ca_7_a_b
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "low"
  })
}

benchmark "fedramp_ca_7_a_b" {
  title       =  "CA-7(a)(b)"
  description = "The organization develops a continuous monitoring strategy and implements a continuous monitoring program that includes: a. Establishment of [Assignment: organization-defined metrics] to be monitored; b. Establishment of [Assignment: organization-defined frequencies] for monitoring and [Assignment: organization-defined frequencies] for assessments supporting such monitoring"
  children = [
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_dead_letter_queue_configured,
    control.cloudtrail_multi_region_trail_enabled,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.securityhub_enabled,
    control.autoscaling_group_with_lb_use_health_check,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.guardduty_enabled,
    control.redshift_cluster_encryption_logging_enabled
  ]

  tags = local.fedramp_common_tags
}
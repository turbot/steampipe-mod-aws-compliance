benchmark "nydfs_23_500_14" {
  title       = "500.14 Monitoring and training"
  description = "Malicious software, commonly referred to as “malware”—including viruses, worms, and Trojans—enters the network during many businessapproved activities including employee e-mail and use of the Internet, mobile computers, and storage devices, resulting in the exploitation of system vulnerabilities. Anti-virus software must be used on all systems commonly affected by malware to protect systems from current and evolving malicious software threats"

  children = [
    benchmark.nydfs_23_500_14_a
  ]

  tags = local.nydfs_23_common_tags
}

benchmark "nydfs_23_500_14_a" {
  title       = "500.14(a)"
  description = "Implement risk-based policies, procedures and controls designed to monitor the activity of Authorized Users and detect unauthorized access or use of, or tampering with, Nonpublic Information by such Authorized Users."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled_check,
    control.cloudwatch_log_group_retention_period_365,
    control.codebuild_project_logging_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.guardduty_enabled,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nydfs_23_common_tags
}


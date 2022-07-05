benchmark "nist_800_171_rev_2_3_3" {
  title       = "Audit and Accountability (AU)"
  description = "The AU control family consists of security controls related to an organization’s audit capabilities. This includes audit policies and procedures, audit logging, audit report generation, and protection of audit information."
  children = [
    benchmark.nist_800_171_rev_2_3_3_1,
    benchmark.nist_800_171_rev_2_3_3_2,
  ]

  tags = local.nist_800_171_rev_2_common_tags
}


benchmark "nist_800_171_rev_2_3_3_1" {
  title       = "3.3.1"
  description = "Create and retain system audit logs and records to the extent needed to enable the monitoring, analysis, investigation, and reporting of unlawful or unauthorized system activity."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.rds_db_instance_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.wafv2_web_acl_logging_enabled,
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_3_2" {
  title       = "3.3.2"
  description = "Ensure that the actions of individual system users can be uniquely traced to those users, so they can be held accountable for their actions."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.rds_db_instance_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.guardduty_enabled,
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

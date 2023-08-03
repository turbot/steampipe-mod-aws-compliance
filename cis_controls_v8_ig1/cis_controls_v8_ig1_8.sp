benchmark "cis_controls_v8_ig1_8" {
  title       = "8 Audit Log Management"
  description = "Collect, alert, review, and retain audit logs of events that could help detect, understand, or recover from an attack."
  children = [
    benchmark.cis_controls_v8_ig1_8_1,
    benchmark.cis_controls_v8_ig1_8_2
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_8_1" {
  title       = "8.1 Establish and Maintain an Audit Log Management Process"
  description = "Establish and maintain an audit log management process that defines the enterprise’s logging requirements. At a minimum, address the collection, review, and retention of audit logs for enterprise assets. Review and update documentation annually, or when significant enterprise changes occur that could impact this Safeguard."
  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_8_2" {
  title       = "8.2 Collect Audit Logs"
  description = "Collect audit logs. Ensure that logging, per the enterprise’s audit log management process, has been enabled across enterprise assets."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}
benchmark "ffiec_d_2_ma" {
  title       = "Monitoring and Analyzing (MA)"
  description = "Monitoring and Analyzing refers to how an institution monitors threat sources and what analysis may be performed to identify threats that are specific to the institution or to resolve conflicts in the different threat intelligence streams."
  children = [
    benchmark.ffiec_d_2_ma_ma_b_1,
    benchmark.ffiec_d_2_ma_ma_b_2
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_2_ma_ma_b_1" {
  title       = "D2.MA.Ma.B.1"
  description = "Audit log records and other security event logs are reviewed and retained in a secure manner."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_object_lock_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_2_ma_ma_b_2" {
  title       = "D2.MA.Ma.B.2"
  description = "Computer event logs are used for investigations once an event has occurred."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = local.ffiec_common_tags
}

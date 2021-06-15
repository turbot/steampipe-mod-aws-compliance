locals {
  rbi_annex_i_7_4_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_7_4"
  })
}

benchmark "rbi_annex_i_7_4" {
  title       = "Annex_I(7.4)"
  description = " Implement appropriate (e.g. centralised) systems and controls to allow, manage, log and monitor privileged/super user/administrative access to critical systems (servers/databases, applications, network devices etc.)."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_integrated_with_logs,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_log_enabled,
    control.wafv2_web_acl_logging_enabled
  ]
  tags = local.rbi_annex_i_7_4_common_tags
}
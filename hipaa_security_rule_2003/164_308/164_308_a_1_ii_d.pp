benchmark "hipaa_security_rule_2003_164_308_a_1_ii_d" {
  title       = "164.308(a)(1)(ii)(D) Information system activity review"
  description = "Implement procedures to regularly review records of information system activity, such as audit logs, access reports, and security incident tracking reports."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.codebuild_project_logging_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.hipaa_security_rule_2003_164_308_common_tags, {
    hipaa_security_rule_2003_item_id = "164_308_a_1_ii_d"
  })
}

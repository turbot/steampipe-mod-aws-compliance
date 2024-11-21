benchmark "nydfs_23_500_06" {
  title       = "500.06 Audit Trail"
  description = "Each covered entity shall securely maintain systems that, to the extent applicable and based on its risk assessment: (1) are designed to reconstruct material financial transactions sufficient to support normal operations and obligations of the covered entity; and (2) include audit trails designed to detect and respond to cybersecurity events that have a reasonable likelihood of materially harming any material part of the normal operations of the covered entity. (b) Each covered entity shall maintain records required by paragraph (a)(1) of this section for not fewer than five years and shall maintain records required by paragraph (a)(2) of this section for not fewer than three years."

  children = [
    benchmark.nydfs_23_500_06_a,
    benchmark.nydfs_23_500_06_b
  ]

  tags = local.nydfs_23_common_tags
}

benchmark "nydfs_23_500_06_a" {
  title       = "500.06(a)"
  description = "Each Covered Entity shall securely maintain systems that, to the extent applicable and based on its Risk Assessment: (1) are designed to reconstruct material financial transactions sufficient to support normal operations and obligations of the Covered Entity; and (2) include audit trails designed to detect and respond to Cybersecurity Events that have a reasonable likelihood of materially harming any material part of the normal operations of the Covered Entity."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.codebuild_project_logging_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nydfs_23_common_tags
}

benchmark "nydfs_23_500_06_b" {
  title       = "500.06(b)"
  description = "Each Covered Entity shall maintain records required by section 500.06(a)(1) of this Part for not fewer than five years and shall maintain records required by section 500.06(a)(2) of this Part for not fewer than three years."

  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = local.nydfs_23_common_tags
}

benchmark "fedramp_low_rev_4_au" {
  title       = benchmark.nist_800_53_rev_4_au.title
  description = benchmark.nist_800_53_rev_4_au.description
  children = [
    benchmark.fedramp_low_rev_4_au_2,
    benchmark.fedramp_low_rev_4_au_9,
    benchmark.fedramp_low_rev_4_au_11,
  ]

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_au_2" {
  title       = "Audit Events (AU-2)"
  description = "The organization: a. Determines that the information system is capable of auditing the following events: [Assignment: organization-defined auditable events]; b. Coordinates the security audit function with other organizational entities requiring audit- related information to enhance mutual support and to help guide the selection of auditable events; c. Provides a rationale for why the auditable events are deemed to be adequate support after- the-fact investigations of security incidents."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled,
  ]

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_au_9" {
  title       = benchmark.nist_800_53_rev_4_au_9.title
  description = benchmark.nist_800_53_rev_4_au_9.description
  children = [
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
  ]

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_au_11" {
  title       = "Audit Record Retention (AU-11)"
  description = "The organization retains audit records for at least 90 days to provide support for after-the-fact investigations of security incidents and to meet regulatory and organizational information retention requirements."
  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.fedramp_low_rev_4_common_tags, {
    service  = "AWS/CloudWatch"
  })
}

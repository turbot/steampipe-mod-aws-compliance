benchmark "fedramp_moderate_rev_4_au" {
  title       = benchmark.nist_800_53_rev_4_au.title
  description = benchmark.nist_800_53_rev_4_au.description
  children = [
    benchmark.fedramp_moderate_rev_4_au_2,
    benchmark.fedramp_moderate_rev_4_au_3,
    benchmark.fedramp_moderate_rev_4_au_6,
    benchmark.fedramp_moderate_rev_4_au_7,
    benchmark.fedramp_moderate_rev_4_au_9,
    benchmark.fedramp_moderate_rev_4_au_11,
    benchmark.fedramp_moderate_rev_4_au_12
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_2" {
  title       = "Audit Events (AU-2)"
  description = "The organization: a. Determines that the information system is capable of auditing the following events: [Assignment: organization-defined auditable events]; b. Coordinates the security audit function with other organizational entities requiring audit- related information to enhance mutual support and to help guide the selection of auditable events; c. Provides a rationale for why the auditable events are deemed to be adequate support after- the-fact investigations of security incidents."
  children = [
    benchmark.fedramp_moderate_rev_4_au_2_a_d
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_2_a_d" {
  title       = "AU-2(a)(d)"
  description = "The organization: a. Determines that the information system is capable of auditing the following events: Successful and unsuccessful account logon events, account management events, object access, policy change, privilege functions, process tracking, and system events. For Web applications: all administrator activity, authentication checks, authorization checks, data deletions, data access, data changes, and permission changes. d. Determines that the following events are to be audited within the information system: [organization-defined subset of the auditable events defined in AU-2 a to be audited continually for each identified event]."
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
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_3" {
  title       = benchmark.nist_800_53_rev_4_au_3.title
  description = benchmark.nist_800_53_rev_4_au_3.description
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
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_6" {
  title       = benchmark.nist_800_53_rev_4_au_6.title
  description = benchmark.nist_800_53_rev_4_au_6.description
  children = [
    benchmark.fedramp_moderate_rev_4_au_6_1_3
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_6_1_3" {
  title       = "AU-6(1)(3)"
  description = "(1) The organization employs automated mechanisms to integrate audit review, analysis, and reporting processes to support organizational processes for investigation and response to suspicious activities. (3) The organization analyzes and correlates audit records across different repositories to gain organization-wide situational awareness."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_7" {
  title       = benchmark.nist_800_53_rev_4_au_7.title
  description = benchmark.nist_800_53_rev_4_au_7.description
  children = [
    benchmark.fedramp_moderate_rev_4_au_7_1
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_7_1" {
  title       = benchmark.nist_800_53_rev_4_au_7_1.title
  description = benchmark.nist_800_53_rev_4_au_7_1.description
  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_9" {
  title       = benchmark.nist_800_53_rev_4_au_9.title
  description = benchmark.nist_800_53_rev_4_au_9.description
  children = [
    benchmark.fedramp_moderate_rev_4_au_9_2,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.log_group_encryption_at_rest_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_9_2" {
  title       = "AU-9(2) Audit Backup On Separate Physical Systems / Components"
  description = "The information system backs up audit records at least weekly onto a physically different system or system component than the system or component being audited."
  children = [
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = merge(local.fedramp_moderate_rev_4_common_tags, {
    service  = "AWS/S3"
  })
}

benchmark "fedramp_moderate_rev_4_au_11" {
  title       = "Audit Record Retention (AU-11)"
  description = "The organization retains audit records for at least 90 days to provide support for after-the-fact investigations of security incidents and to meet regulatory and organizational information retention requirements."
  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.fedramp_moderate_rev_4_common_tags, {
    service  = "AWS/CloudWatch"
  })
}

benchmark "fedramp_moderate_rev_4_au_12" {
  title       = benchmark.nist_800_53_rev_4_au_12.title
  description = benchmark.nist_800_53_rev_4_au_12.description
  children = [
    benchmark.fedramp_moderate_rev_4_au_12_a_c
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_au_12_a_c" {
  title       = "AU-12(a)(c)"
  description = "The information system: a. Provides audit record generation capability for the auditable events defined in AU-2 a. at all information system and network components where audit capability is deployed/available c. Generates audit records for the events defined in AU-2 d. with the content defined in AU-3."
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
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}
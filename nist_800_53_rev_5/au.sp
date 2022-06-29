benchmark "nist_800_53_rev_5_au" {
  title       = "Audit and Accountability (AU)"
  description = "The AU control family consists of security controls related to an organization’s audit capabilities. This includes audit policies and procedures, audit logging, audit report generation, and protection of audit information."
  children = [
    benchmark.nist_800_53_rev_5_au_2,
    benchmark.nist_800_53_rev_5_au_3,
    benchmark.nist_800_53_rev_5_au_4,
    benchmark.nist_800_53_rev_5_au_6,
    benchmark.nist_800_53_rev_5_au_7,
    benchmark.nist_800_53_rev_5_au_8,
    benchmark.nist_800_53_rev_5_au_9,
    benchmark.nist_800_53_rev_5_au_10,
    benchmark.nist_800_53_rev_5_au_11,
    benchmark.nist_800_53_rev_5_au_12,
    benchmark.nist_800_53_rev_5_au_14,
    benchmark.nist_800_53_rev_5_au_16
  ]

  tags = local.nist_800_53_rev_5_common_tags
}


benchmark "nist_800_53_rev_5_au_2" {
  title       = "Event Logging (AU-2)"
  description = "Automate security audit function with other organizational entities. Enable mutual support of audit of auditable events."
  children = [
    benchmark.nist_800_53_rev_5_au_2_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_2_b" {
  title       = "AU-2(b)"
  description = "Coordinate the event logging function with other organizational entities requiring audit-related information to guide and inform the selection criteria for events to be logged."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_3" {
  title       = "Content of Audit Records (AU-3)"
  description = "The information system generates audit records containing information that establishes what type of event occurred, when the event occurred, where the event occurred, the source of the event, the outcome of the event, and the identity of any individuals or subjects associated with the event."
  children = [
    benchmark.nist_800_53_rev_5_au_3_1,
    benchmark.nist_800_53_rev_5_au_3_a,
    benchmark.nist_800_53_rev_5_au_3_b,
    benchmark.nist_800_53_rev_5_au_3_c,
    benchmark.nist_800_53_rev_5_au_3_d,
    benchmark.nist_800_53_rev_5_au_3_e,
    benchmark.nist_800_53_rev_5_au_3_f
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_3_a" {
  title       = "AU-3(a)"
  description = "Ensure that audit records contain information that establishes the following: a. What type of event occurred."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_3_b" {
  title       = "AU-3(b)"
  description = "Ensure that audit records contain information that establishes the following: b. When the event occurred."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_3_c" {
  title       = "AU-3(c)"
  description = "Ensure that audit records contain information that establishes the following: c. Where the event occurred."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_3_d" {
  title       = "AU-3(d)"
  description = "Ensure that audit records contain information that establishes the following: d. Source of the event."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_3_e" {
  title       = "AU-3(e)"
  description = "Ensure that audit records contain information that establishes the following: e. Outcome of the event."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_3_f" {
  title       = "AU-3(f)"
  description = "Ensure that audit records contain information that establishes the following: e. Outcome of the event."
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
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_3_1" {
  title       = "AU-3(1) Additional Audit Information"
  description = "Generate audit records containing the following additional information: [Assignment: organization-defined additional information]."
  children = [
    control.cloudtrail_trail_enabled,
    control.guardduty_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_4" {
  title       = "Audit Log Stprage Capacity (AU-4)"
  description = "Allocate audit log storage capacity to accommodate [Assignment: organization-defined audit log retention requirements]."
  children = [
    benchmark.nist_800_53_rev_5_au_4_1
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_4_1" {
  title       = "AU-4(1) Transfer To Alternate Storage"
  description = "Transfer audit logs [Assignment: organization-defined frequency] to a different system, system component, or media other than the system or system component conducting the logging."
  children = [
    control.cloudtrail_trail_integrated_with_logs
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_6" {
  title       = "Audit Record Review, Analysis And Reporting (AU-6)"
  description = "Integrate audit review, analysis, and reporting with processes for investigation and response to suspicious activities."
  children = [
    benchmark.nist_800_53_rev_5_au_6_1,
    benchmark.nist_800_53_rev_5_au_6_3,
    benchmark.nist_800_53_rev_5_au_6_4,
    benchmark.nist_800_53_rev_5_au_6_5,
    benchmark.nist_800_53_rev_5_au_6_6,
    benchmark.nist_800_53_rev_5_au_6_9
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_6_1" {
  title       = "AU-6(1) Automated Process Integration"
  description = "Integrate audit record review, analysis, and reporting processes using [Assignment: organization-defined automated mechanisms]."
  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_6_3" {
  title       = "AU-6(3) Correlate Audit Record Repositories"
  description = "Analyze and correlate audit records across different repositories to gain organization-wide situational awareness."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_6_4" {
  title       = "AU-6(4) Central Review And Analysis"
  description = "Provide and implement the capability to centrally review and analyze audit records from multiple components within the system."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_6_5" {
  title       = "AU-6(5) Central Review And Analysis"
  description = "Integrate analysis of audit records with analysis of [Selection (one or more): vulnerability scanning information; performance data; system monitoring information; [Assignment: organization-defined data/information collected from other sources]] to further enhance the ability to identify inappropriate or unusual activity."
  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_6_6" {
  title       = "AU-6(6) Correletion With Physical Monitoring"
  description = "Correlate information from audit records with information obtained from monitoring physical access to further enhance the ability to identify suspicious, inappropriate, unusual, or malevolent activity."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_6_9" {
  title       = "AU-6(9) Correletion With From Nontechnical Sources"
  description = "Correlate information from nontechnical sources with audit record information to enhance organization-wide situational awareness."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_7" {
  title       = "Audit Record Reduction And Report Generation (AU-7)"
  description = "Support for real-time audit review, analysis, and reporting requirements without altering original audit records."
  children = [
    benchmark.nist_800_53_rev_5_au_7_1
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_7_1" {
  title       = "AU-7(1) Automatic Processing"
  description = "Provide and implement the capability to process, sort, and search audit records for events of interest based on the following content: [Assignment: organization-defined fields within audit records]."
  children = [
    control.cloudtrail_trail_integrated_with_logs
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_8" {
  title       = "Time Stamps (AU-8)"
  description = "Use internal system clocks to generate time stamps for audit records."
  children = [
    benchmark.nist_800_53_rev_5_au_8_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_8_b" {
  title       = "AU-8(b)"
  description = "Record time stamps for audit records that meet [Assignment: organization-defined granularity of time measurement] and that use Coordinated Universal Time, have a fixed local time offset from Coordinated Universal Time, or that include the local time offset as part of the time stamp."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_9" {
  title       = "Protection of Audit Information (AU-9)"
  description = "Protect audit information & tools from unauthorized access, modification & deletion."
  children = [
    benchmark.nist_800_53_rev_5_au_9_2,
    benchmark.nist_800_53_rev_5_au_9_3,
    benchmark.nist_800_53_rev_5_au_9_7,
    benchmark.nist_800_53_rev_5_au_9_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_9_a" {
  title       = "AU-9(a)"
  description = "Protect audit information and audit logging tools from unauthorized access, modification, and deletion."
  children = [
    control.cloudtrail_trail_validation_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_9_2" {
  title       = "AU-9(2) Store On Separate Physical Systems Or Components"
  description = "Store audit records [Assignment: organization-defined frequency] in a repository that is part of a physically different system or system component than the system or component being audited."
  children = [
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/S3"
  })
}

benchmark "nist_800_53_rev_5_au_9_3" {
  title       = "AU-9(3) Cryptographic Protection"
  description = "Implement cryptographic mechanisms to protect the integrity of audit information and audit tools."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dynamodb_table_encrypted_with_kms,
    control.ebs_volume_encryption_at_rest_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk,
    control.sns_topic_encrypted_at_rest
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_9_7" {
  title       = "AU-9(7) Store On Component With Different Operation Systems"
  description = "Store audit information on a component running a different operating system than the system or component being audited."
  children = [
    control.cloudtrail_trail_integrated_with_logs
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_10" {
  title       = "Non-Repudiation (AU-10)"
  description = "Provide irrefutable evidence that an individual (or process acting on behalf of an individual) has performed [Assignment: organization-defined actions to be covered by non-repudiation]."
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
    control.s3_bucket_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_11" {
  title       = "Audit Record Retention (AU-11)"
  description = "Retain audit records for [Assignment: organization-defined time period consistent with records retention policy] to provide support for after-the-fact investigations of incidents and to meet regulatory and organizational information retention requirements."
  children = [
    benchmark.nist_800_53_rev_5_au_11_1,
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudWatch"
  })
}


benchmark "nist_800_53_rev_5_au_11_1" {
  title       = "AU-11(1) Long-Term Retrieval Capability"
  description = "Employ [Assignment: organization-defined measures] to ensure that long-term audit records generated by the system can be retrieved."
  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudWatch"
  })
}

benchmark "nist_800_53_rev_5_au_12" {
  title       = "Audit Record Generation (AU-12)"
  description = "Audit events defined in AU-2. Allow trusted personnel to select which events to audit. Generate audit records for events."
  children = [
    benchmark.nist_800_53_rev_5_au_12_1,
    benchmark.nist_800_53_rev_5_au_12_2,
    benchmark.nist_800_53_rev_5_au_12_3,
    benchmark.nist_800_53_rev_5_au_12_4,
    benchmark.nist_800_53_rev_5_au_12_a,
    benchmark.nist_800_53_rev_5_au_12_c
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_12_a" {
  title       = "AU-12(a)"
  description = "Provide audit record generation capability for the event types the system is capable of auditing as defined in AU-2a on [Assignment: organization-defined system components]."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_12_c" {
  title       = "AU-12(c)"
  description = "Generate audit records for the event types defined in AU-2c that include the audit record content defined in AU-3."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_12_1" {
  title       = "AU-12(1) System-Wide And Time-Correlated Audit Trial"
  description = "Compile audit records from [Assignment: organization-defined system components] into a system-wide (logical or physical) audit trail that is time-correlated to within [Assignment: organization-defined level of tolerance for the relationship between time stamps of individual records in the audit trail]."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_12_2" {
  title       = "AU-12(2) Standardized Formats"
  description = "Produce a system-wide (logical or physical) audit trail composed of audit records in a standardized format."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_12_3" {
  title       = "AU-12(3) Changes By Authorized Individuals"
  description = "Provide and implement the capability for [Assignment: organization-defined individuals or roles] to change the logging to be performed on [Assignment: organization-defined system components] based on [Assignment: organization-defined selectable event criteria] within [Assignment: organization-defined time thresholds]."
  children = [
    control.apigateway_stage_logging_enabled,
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_12_4" {
  title       = "AU-12(4) Query Parameter Audits Of Personally Identifiable Information"
  description = "Provide and implement the capability for auditing the parameters of user query events for data sets containing personally identifiable information."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_14" {
  title       = "Session Audit (AU-14)"
  description = "Capture, record and log user sessions. Remotely view all content related to a user session that starts at system start-up."
  children = [
    benchmark.nist_800_53_rev_5_au_14_3,
    benchmark.nist_800_53_rev_5_au_14_a,
    benchmark.nist_800_53_rev_5_au_14_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_14_a" {
  title       = "AU-14(a)"
  description = "Provide and implement the capability for [Assignment: organization-defined users or roles] to [Selection (one or more): record; view; hear; log] the content of a user session under [Assignment: organization-defined circumstances]."
  children = [
    control.apigateway_stage_logging_enabled,
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_14_b" {
  title       = "AU-14(b)"
  description = "Develop, integrate, and use session auditing activities in consultation with legal counsel and in accordance with applicable laws, executive orders, directives, regulations, policies, standards, and guidelines."
  children = [
    control.apigateway_stage_logging_enabled,
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_14_3" {
  title       = "AU-14(3) Remote Viewing And Listening"
  description = "Provide and implement the capability for authorized users to remotely view and hear content related to an established user session in real time."
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

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_au_16" {
  title       = "Cross-Organizational Audit Logging (AU-16)"
  description = "Employ [Assignment: organization-defined methods] for coordinating [Assignment: organization-defined audit information] among external organizations when audit information is transmitted across organizational boundaries."
  children = [
    control.cloudtrail_trail_integrated_with_logs
  ]

  tags = local.nist_800_53_rev_5_common_tags
}
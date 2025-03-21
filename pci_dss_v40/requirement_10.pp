locals {
  pci_dss_v40_requirement_10_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "10"
  })
}

benchmark "pci_dss_v40_requirement_10" {
  title       = "Requirement 10: Log and Monitor All Access to System Components and Cardholder Data"
  description = "Logging mechanisms and the ability to track user activities are critical in preventing, detecting, or minimizing the impact of a data compromise. The presence of logs on all system components and in the cardholder data environment (CDE) allows thorough tracking, alerting, and analysis when something does go wrong. Determining the cause of a compromise is difficult, if not impossible, without system activity logs."

  children = [
    benchmark.pci_dss_v40_requirement_10_2,
    benchmark.pci_dss_v40_requirement_10_3,
    benchmark.pci_dss_v40_requirement_10_4,
    benchmark.pci_dss_v40_requirement_10_5,
    benchmark.pci_dss_v40_requirement_10_6,
    benchmark.pci_dss_v40_requirement_10_7
  ]

  tags = local.pci_dss_v40_requirement_10_common_tags
}

benchmark "pci_dss_v40_requirement_10_2" {
  title       = "10.2: Audit logs are implemented to support the detection of anomalies and suspicious activity, and the forensic analysis of events"

  children = [
    benchmark.pci_dss_v40_requirement_10_2_1,
    benchmark.pci_dss_v40_requirement_10_2_2
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2"
  })
}

benchmark "pci_dss_v40_requirement_10_2_1" {
  title       = "10.2.1: Audit logs are enabled and active for all system components and cardholder data"
  description = "Audit logs must exist for all system components. Audit logs send alerts the system administrator, provides data to other monitoring mechanisms, such as intrusion-detection systems (IDS) and security information and event monitoring systems (SIEM) tools, and provide a history trail for post-incident investigation."

  children = [
    benchmark.pci_dss_v40_requirement_10_2_1_1,
    benchmark.pci_dss_v40_requirement_10_2_1_2,
    benchmark.pci_dss_v40_requirement_10_2_1_3,
    benchmark.pci_dss_v40_requirement_10_2_1_4,
    benchmark.pci_dss_v40_requirement_10_2_1_5,
    benchmark.pci_dss_v40_requirement_10_2_1_6,
    benchmark.pci_dss_v40_requirement_10_2_1_7
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2.1"
  })
}

benchmark "pci_dss_v40_requirement_10_2_1_1" {
  title       = "10.2.1.1: Audit logs capture all individual user access to cardholder data"
  description = "It is critical to have a process or system that links user access to system components accessed. Malicious individuals could obtain knowledge of a user account with access to systems in the CDE, or they could create a new, unauthorized account to access cardholder data."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.sfn_state_machine_logging_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_rule_group_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2.1.1"
  })
}

benchmark "pci_dss_v40_requirement_10_2_1_2" {
  title       = "10.2.1.2: Audit logs capture all actions taken by any individual with administrative access, including any interactive use of application or system accounts"
  description = "Accounts with increased access privileges, such as the “administrator” or “root” account, have the potential to significantly impact the security or operational functionality of a system. Without a log of the activities performed, an organization is cannot trace any issues resulting from an administrative mistake or misuse of privilege back to the specific action and account."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.sfn_state_machine_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2.1.2"
  })
}

benchmark "pci_dss_v40_requirement_10_2_1_3" {
  title       = "10.2.1.3: Audit logs capture all access to audit logs"
  description = "Malicious users often attempt to alter audit logs to hide their actions. A record of access allows an organization to trace any inconsistencies or potential tampering of the logs to an individual account. Having logs identify changes, additions, and deletions to the audit logs can help retrace steps made by unauthorized personnel."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.sfn_state_machine_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2.1.3"
  })
}

benchmark "pci_dss_v40_requirement_10_2_1_4" {
  title       = "10.2.1.4: Audit logs capture all invalid logical access attempts"
  description = "Malicious individuals will often perform multiple access attempts on targeted systems. Multiple invalid login attempts may be an indication of an unauthorized user's attempts to “brute force” or guess a password."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.sfn_state_machine_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2.1.4"
  })
}

benchmark "pci_dss_v40_requirement_10_2_1_5" {
  title       = "10.2.1.5: Audit logs capture all changes to identification and authentication credentials including, but not limited"
  description = "Logging changes to authentication credentials (including elevation of privileges, additions, and deletions of accounts with administrative access) provides residual evidence of activities."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.sfn_state_machine_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2.1.5"
  })
}

benchmark "pci_dss_v40_requirement_10_2_1_6" {
  title       = "10.2.1.6: Records of all changes to audit log activity status are captured"
  description = "Turning off or pausing audit logs before performing illicit activities is common practice for malicious users who want to avoid detection. Initialization of audit logs could indicate that that a user disabled the log function to hide their actions."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.sfn_state_machine_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2.1.6"
  })
}

benchmark "pci_dss_v40_requirement_10_2_1_7" {
  title       = "10.2.1.7: Audit logs capture all creation and deletion of system-level objects"
  description = "Malicious software, such as malware, often creates or replaces system-level objects on the target system to control a particular function or operation on that system. By logging when system-level objects are created or deleted, it will be easier to determine whether such modifications were authorized."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.sfn_state_machine_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2.1.7"
  })
}

benchmark "pci_dss_v40_requirement_10_2_2" {
  title       = "10.2.2: Sufficient data to be able to identify successful and failed attempts and who, what, when, where, and how for each event listed in requirement 10.2.2 are captured"
  description = "By recording these details for the auditable events at 10.2.1.1 through 10.2.1.7, a potential compromise can be quickly identified, with sufficient detail to facilitate following up on suspicious activities."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.sfn_state_machine_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.2.2"
  })
}

benchmark "pci_dss_v40_requirement_10_3" {
  title       = "10.3: Audit logs are protected from destruction and unauthorized modifications"

  children = [
    benchmark.pci_dss_v40_requirement_10_3_1,
    benchmark.pci_dss_v40_requirement_10_3_2,
    benchmark.pci_dss_v40_requirement_10_3_3,
    benchmark.pci_dss_v40_requirement_10_3_4
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.3"
  })
}

benchmark "pci_dss_v40_requirement_10_3_1" {
  title       = "10.3.1: Read access to audit logs files is limited to those with a job-related need"
  description = "Audit log files contain sensitive information, and read access to the log files must be limited only to those with a valid business need. This access includes audit log files on the originating systems as well as anywhere else they are stored."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.sfn_state_machine_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.3.1"
  })
}

benchmark "pci_dss_v40_requirement_10_3_2" {
  title       = "10.3.2: Audit log files are protected to prevent modifications by individuals"
  description = "Often a malicious individual who has entered the network will try to edit the audit logs to hide their activity. Without adequate protection of audit logs, their completeness, accuracy, and integrity cannot be guaranteed, and the audit logs can be rendered useless as an investigation tool after a compromise. Therefore, audit logs should be protected on the originating systems as well as anywhere else they are stored."

  children = [
    control.backup_recovery_point_manual_deletion_disabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ebs_snapshot_not_publicly_restorable,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.emr_account_public_access_blocked,
    control.lambda_function_restrict_public_access,
    control.log_group_encryption_at_rest_enabled,
    control.neptune_db_cluster_snapshot_prohibit_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_access_point_restrict_public_access,
    control.s3_bucket_mfa_delete_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ssm_document_prohibit_public_access
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.3.2"
  })
}

benchmark "pci_dss_v40_requirement_10_3_3" {
  title       = "10.3.3: Audit log files, including those for externalfacing technologies, are promptly backed up to a secure, central, internal log server(s) or other media that is difficult to modify"
  description = "Promptly backing up the logs to a centralized log server or media that is difficult to alter keeps the logs protected, even if the system generating the logs becomes compromised."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.fsx_file_system_protected_by_backup_plan,
    control.log_group_encryption_at_rest_enabled,
    control.neptune_db_cluster_automated_backup_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_public_access_block_bucket
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.3.3"
  })
}

benchmark "pci_dss_v40_requirement_10_3_4" {
  title       = "10.3.4: File integrity monitoring or change-detection mechanisms is used on audit logs to ensure that existing log data cannot be changed without generating alerts"
  description = "File integrity monitoring or change-detection systems check for changes to critical files and notify when such changes are identified. For file integrity monitoring purposes, an entity usually monitors files that do not regularly change, but when changed, indicate a possible compromise."

  children = [
    control.cloudfront_distribution_origin_access_identity_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_versioning_enabled,
    control.s3_public_access_block_bucket
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.3.4"
  })
}

benchmark "pci_dss_v40_requirement_10_4" {
  title       = "10.4: Audit logs are reviewed to identify anomalies or suspicious activity"

  children = [
    benchmark.pci_dss_v40_requirement_10_4_1,
    benchmark.pci_dss_v40_requirement_10_4_1_1,
    benchmark.pci_dss_v40_requirement_10_4_2,
    benchmark.pci_dss_v40_requirement_10_4_3
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.4"
  })
}

benchmark "pci_dss_v40_requirement_10_4_1" {
  title       = "10.4.1: Potentially suspicious or anomalous activities are quickly identified to minimize impact"
  description = "Many breaches occur months before being detected. Regular log reviews mean incidents can be quickly identified and proactively addressed."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.securityhub_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.wafv2_rule_group_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.4.1"
  })
}

benchmark "pci_dss_v40_requirement_10_4_1_1" {
  title       = "10.4.1.1: Automated mechanisms are used to perform audit log reviews"
  description = "Manual log reviews are difficult to perform, even for one or two systems, due to the amount of log data that is generated. However, using log harvesting, parsing, and alerting tools, centralized log management systems, event log analyzers, and security information and event management (SIEM) solutions can help facilitate the process by identifying log events that need to be reviewed."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.config_enabled_all_regions,
    control.ec2_instance_detailed_monitoring_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.securityhub_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.wafv2_rule_group_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.4.1.1"
  })
}

benchmark "pci_dss_v40_requirement_10_4_2" {
  title       = "10.4.2: Logs of all other system components (those not specified in Requirement 10.4.2) are reviewed periodically"
  description = "Periodic review of logs for all other system components (not specified in Requirement 10.4.2) helps to identify indications of potential issues or attempts to access critical systems via less-critical systems."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.securityhub_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.wafv2_rule_group_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.4.2"
  })
}

benchmark "pci_dss_v40_requirement_10_4_3" {
  title       = "10.4.3: Exceptions and anomalies identified during the review process are addressed"
  description = "If exceptions and anomalies identified during the log-review process are not investigated, the entity may be unaware of unauthorized and potentially malicious activities occurring within their network."

  children = [
    control.cloudwatch_alarm_action_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.4.3"
  })
}

benchmark "pci_dss_v40_requirement_10_5" {
  title       = "10.5: Audit log history is retained and available for analysis"

  children = [
    benchmark.pci_dss_v40_requirement_10_5_1
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.5"
  })
}

benchmark "pci_dss_v40_requirement_10_5_1" {
  title       = "10.5.1: Retain audit log history for at least 12 months, with at least the most recent three months immediately available for analysis"
  description = "Retaining historical audit logs for at least 12 months is necessary because compromises often go unnoticed for significant lengths of time. Having centrally stored log history allows investigators to better determine the length of time a potential breach was occurring, and the possible system(s) impacted. By having three months of logs immediately available, an entity can quickly identify and minimize impact of a data breach."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.docdb_cluster_backup_retention_period_7_days,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_unused,
    control.ecr_repository_lifecycle_policy_configured,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.5.1"
  })
}

benchmark "pci_dss_v40_requirement_10_6" {
  title       = "10.6: Time-synchronization mechanisms support consistent time settings across all systems"

  children = [
    benchmark.pci_dss_v40_requirement_10_6_3
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.6"
  })
}

benchmark "pci_dss_v40_requirement_10_6_3" {
  title       = "10.6.3: Time synchronization settings and data are protected"
  description = "Attackers will try to change time configurations to hide their activity. Therefore, restricting the ability to change or modify time synchronization configurations or the system time to administrators will lessen the probability of an attacker successfully changing time configurations."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.iam_user_in_group,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.securityhub_enabled,
    control.sfn_state_machine_logging_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_rule_group_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.6.3"
  })
}

benchmark "pci_dss_v40_requirement_10_7" {
  title       = "10.7: Failures of critical security control systems are detected, reported, and responded to promptly"

  children = [
    benchmark.pci_dss_v40_requirement_10_7_1,
    benchmark.pci_dss_v40_requirement_10_7_2
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.7"
  })
}

benchmark "pci_dss_v40_requirement_10_7_1" {
  title       = "10.7.1: Additional requirement for service providers only: Failures of critical security control systems are detected, alerted, and addressed promptly, including but not limited to failure"
  description = "Without formal processes to detect and alert when critical security controls fail, failures may go undetected for extended periods and provide attackers ample time to compromise system components and steal account data from the CDE."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.cloudformation_stack_notifications_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.securityhub_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.wafv2_rule_group_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.7.1"
  })
}

benchmark "pci_dss_v40_requirement_10_7_2" {
  title       = "10.7.2: Failures in critical security control systems are promptly identified and addressed"
  description = "Without formal processes to detect and alert when critical security controls fail, failures may go undetected for extended periods and provide attackers ample time to compromise system components and steal account data from the CDE."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.cloudformation_stack_notifications_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.securityhub_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.wafv2_rule_group_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_10_common_tags, {
    pci_dss_v40_item_id = "10.7.2"
  })
} 
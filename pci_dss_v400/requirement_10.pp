locals {
  pci_dss_v400_requirement_10_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "10"
  })
}

benchmark "pci_dss_v400_requirement_10" {
  title = "Requirement 10: Log and Monitor All Access to System Components and Cardholder Data"

  children = [
    benchmark.pci_dss_v400_requirement_10_2,
    benchmark.pci_dss_v400_requirement_10_3,
    benchmark.pci_dss_v400_requirement_10_4,
    benchmark.pci_dss_v400_requirement_10_5,
    benchmark.pci_dss_v400_requirement_10_6,
    benchmark.pci_dss_v400_requirement_10_7
  ]

  tags = local.pci_dss_v400_requirement_10_common_tags
}

benchmark "pci_dss_v400_requirement_10_2" {
  title = "10.2: Implement Automated Audit Trails"

  children = [
    benchmark.pci_dss_v400_requirement_10_2_1,
    benchmark.pci_dss_v400_requirement_10_2_2
  ]

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2"
  })
}

benchmark "pci_dss_v400_requirement_10_2_1" {
  title = "10.2.1: Automated audit trails are implemented for all system components."

  children = [
    benchmark.pci_dss_v400_requirement_10_2_1_1,
    benchmark.pci_dss_v400_requirement_10_2_1_2,
    benchmark.pci_dss_v400_requirement_10_2_1_3,
    benchmark.pci_dss_v400_requirement_10_2_1_4,
    benchmark.pci_dss_v400_requirement_10_2_1_5,
    benchmark.pci_dss_v400_requirement_10_2_1_6,
    benchmark.pci_dss_v400_requirement_10_2_1_7
  ]

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2.1"
  })
}

benchmark "pci_dss_v400_requirement_10_2_1_1" {
  title       = "10.2.1.1: All individual user accesses to cardholder data."
  description = "All individual user accesses to cardholder data."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2.1.1"
  })
}

benchmark "pci_dss_v400_requirement_10_2_1_2" {
  title       = "10.2.1.2: All actions taken by any individual with administrative privileges."
  description = "All actions taken by any individual with administrative privileges."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2.1.2"
  })
}

benchmark "pci_dss_v400_requirement_10_2_1_3" {
  title       = "10.2.1.3: Access to all audit trails."
  description = "Access to all audit trails."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2.1.3"
  })
}

benchmark "pci_dss_v400_requirement_10_2_1_4" {
  title       = "10.2.1.4: Invalid logical access attempts."
  description = "Invalid logical access attempts."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2.1.4"
  })
}

benchmark "pci_dss_v400_requirement_10_2_1_5" {
  title       = "10.2.1.5: Use of and changes to identification and authentication mechanisms."
  description = "Use of and changes to identification and authentication mechanisms including but not limited to creation of new accounts and escalation of privileges and all changes, additions, or deletions to accounts with root or administrative privileges."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2.1.5"
  })
}

benchmark "pci_dss_v400_requirement_10_2_1_6" {
  title       = "10.2.1.6: Initialization, stopping, or pausing of the audit logs."
  description = "Initialization, stopping, or pausing of the audit logs."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2.1.6"
  })
}

benchmark "pci_dss_v400_requirement_10_2_1_7" {
  title       = "10.2.1.7: Creation and deletion of system-level objects."
  description = "Creation and deletion of system-level objects."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2.1.7"
  })
}

benchmark "pci_dss_v400_requirement_10_2_2" {
  title       = "10.2.2: Audit log entries for the events at 10.2.1 capture all the elements required at 10.3."
  description = "Audit log entries for the events at 10.2.1 capture all the elements required at 10.3."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.2.2"
  })
}

benchmark "pci_dss_v400_requirement_10_3" {
  title = "10.3: Record Audit Trail Entries for All System Components For Each Event"

  children = [
    benchmark.pci_dss_v400_requirement_10_3_1,
    benchmark.pci_dss_v400_requirement_10_3_2,
    benchmark.pci_dss_v400_requirement_10_3_3,
    benchmark.pci_dss_v400_requirement_10_3_4
  ]

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.3"
  })
}

benchmark "pci_dss_v400_requirement_10_3_1" {
  title       = "10.3.1: The following audit trail entries are recorded for all system components for each auditable event."
  description = "User identification."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.3.1"
  })
}

benchmark "pci_dss_v400_requirement_10_3_2" {
  title       = "10.3.2: The following audit trail entries are recorded for all system components for each auditable event."
  description = "Type of event."

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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.3.2"
  })
}

benchmark "pci_dss_v400_requirement_10_3_3" {
  title       = "10.3.3: The following audit trail entries are recorded for all system components for each auditable event."
  description = "Date and time."

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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.3.3"
  })
}

benchmark "pci_dss_v400_requirement_10_3_4" {
  title       = "10.3.4: The following audit trail entries are recorded for all system components for each auditable event."
  description = "Success or failure indication."

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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.3.4"
  })
}

benchmark "pci_dss_v400_requirement_10_4" {
  title = "10.4: Audit Logs Are Available for Review"

  children = [
    benchmark.pci_dss_v400_requirement_10_4_1,
    benchmark.pci_dss_v400_requirement_10_4_1_1,
    benchmark.pci_dss_v400_requirement_10_4_2,
    benchmark.pci_dss_v400_requirement_10_4_3
  ]

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.4"
  })
}

benchmark "pci_dss_v400_requirement_10_4_1" {
  title       = "10.4.1: Audit logs are available for review."
  description = "Audit logs from critical technologies (PCI DSS requirement 10.4.2.1) are retained for at least 12 months."

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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.4.1"
  })
}

benchmark "pci_dss_v400_requirement_10_4_1_1" {
  title       = "10.4.1.1: Audit logs from critical technologies (PCI DSS requirement 10.4.2.1) are retained for at least 12 months."
  description = "Audit logs from critical technologies (PCI DSS requirement 10.4.2.1) are retained for at least 12 months."

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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.4.1.1"
  })
}

benchmark "pci_dss_v400_requirement_10_4_2" {
  title       = "10.4.2: The following are required for audit log entries for all system components for each event."
  description = "The following are required for audit log entries for all system components for each event, for all auditable events at 10.2.1.1 through 10.2.1.7."

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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.4.2"
  })
}

benchmark "pci_dss_v400_requirement_10_4_3" {
  title       = "10.4.3: Audit logs are protected from unauthorized modifications via access control mechanisms, physical segregation, and/or network segregation."
  description = "Audit logs are protected from unauthorized modifications via access control mechanisms, physical segregation, and/or network segregation."

  children = [
    control.cloudwatch_alarm_action_enabled
  ]

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.4.3"
  })
}

benchmark "pci_dss_v400_requirement_10_5" {
  title = "10.5: Protect Audit Logs and Their Contents"

  children = [
    benchmark.pci_dss_v400_requirement_10_5_1,
  ]

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.5"
  })
}

benchmark "pci_dss_v400_requirement_10_5_1" {
  title       = "10.5.1: Audit logs are protected from unauthorized modifications via access control mechanisms, physical segregation, and/or network segregation."
  description = "Audit logs are protected from unauthorized modifications via access control mechanisms, physical segregation, and/or network segregation."

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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.5.1"
  })
}

benchmark "pci_dss_v400_requirement_10_6" {
  title = "10.6: Review Logs and Security Events"

  children = [
    benchmark.pci_dss_v400_requirement_10_6_3,
  ]

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.6"
  })
}

benchmark "pci_dss_v400_requirement_10_6_3" {
  title       = "10.6.3: Exceptions and anomalies identified during the review process are addressed."
  description = "Exceptions and anomalies identified during the review process are addressed."

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
    control.docdb_cluster_audit_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_logging_enabled,
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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.6.3"
  })
}

benchmark "pci_dss_v400_requirement_10_7" {
  title = "10.7: Maintain Security of Audit Logs"

  children = [
    benchmark.pci_dss_v400_requirement_10_7_1,
    benchmark.pci_dss_v400_requirement_10_7_2
  ]

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.7"
  })
}

benchmark "pci_dss_v400_requirement_10_7_1" {
  title       = "10.7.1: Security policies and operational procedures for monitoring all access to network resources and cardholder data are documented, in use, and known to all affected parties."
  description = "Security policies and operational procedures for monitoring all access to network resources and cardholder data are documented, in use, and known to all affected parties."

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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.7.1"
  })
}

benchmark "pci_dss_v400_requirement_10_7_2" {
  title       = "10.7.2: Security policies and operational procedures for monitoring all access to network resources and cardholder data: Are updated as needed to address changes in regulatory requirements, emerging threats and vulnerabilities, and/or the entity's operational environment."
  description = "Security policies and operational procedures for monitoring all access to network resources and cardholder data: Are updated as needed to address changes in regulatory requirements, emerging threats and vulnerabilities, and/or the entity's operational environment."

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

  tags = merge(local.pci_dss_v400_requirement_10_common_tags, {
    pci_dss_v400_item_id = "10.7.2"
  })
} 
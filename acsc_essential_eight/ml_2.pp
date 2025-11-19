locals {
  acsc_essential_eight_ml_2_common_tags = merge(local.acsc_essential_eight_common_tags, {
    maturity_level = "2"
  })
}

benchmark "acsc_essential_eight_ml_2" {
  title       = "ACSC Essential Eight Maturity Level 2"
  description = "The Essential Eight Maturity Model is a prioritised list of strategies to mitigate cyber security incidents. The model consists of 8 essential strategies that organisations can implement to protect their systems from a range of adversaries."

  children = [
    benchmark.acsc_essential_eight_ml_2_1,
    benchmark.acsc_essential_eight_ml_2_2,
    benchmark.acsc_essential_eight_ml_2_5,
    benchmark.acsc_essential_eight_ml_2_6,
    benchmark.acsc_essential_eight_ml_2_7,
    benchmark.acsc_essential_eight_ml_2_8
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_1" {
  title       = "ACSC-EE-ML2-1: Patch applications ML2"
  description = "An automated method of asset discovery is used at least weekly to support the detection of assets for subsequent vulnerability scanning activities."

  children = [
    benchmark.acsc_essential_eight_ml_2_1_3
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_1_3" {
  title       = "ACSC-EE-ML2-1.3: Application control ML2"
  description = "Allowed and blocked execution events on workstations and internet-facing servers are logged."

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

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_2" {
  title       = "ACSC-EE-ML2-2: Patch operating systems ML2"
  description = "An automated method of asset discovery is used at least weekly to support the detection of assets for subsequent vulnerability scanning activities."

  children = [
    benchmark.acsc_essential_eight_ml_2_2_5
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_2_5" {
  title       = "ACSC-EE-ML2-2.5: Patch applications ML2"
  description = "A vulnerability scanner is used at least fortnightly to identify missing patches or updates for security vulnerabilities in other applications."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5" {
  title       = "ACSC-EE-ML2-5: Restrict administrative privileges ML2"
  description = "Requests for privileged access to systems and applications are validated when first requested."

  children = [
    benchmark.acsc_essential_eight_ml_2_5_2,
    benchmark.acsc_essential_eight_ml_2_5_3,
    benchmark.acsc_essential_eight_ml_2_5_4,
    benchmark.acsc_essential_eight_ml_2_5_5,
    benchmark.acsc_essential_eight_ml_2_5_6,
    benchmark.acsc_essential_eight_ml_2_5_7,
    benchmark.acsc_essential_eight_ml_2_5_8,
    benchmark.acsc_essential_eight_ml_2_5_9,
    benchmark.acsc_essential_eight_ml_2_5_10,
    benchmark.acsc_essential_eight_ml_2_5_11,
    benchmark.acsc_essential_eight_ml_2_5_12
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_2" {
  title       = "ACSC-EE-ML2-5.2: Restrict administrative privileges ML2"
  description = "Privileged access to systems and applications is automatically disabled after 12 months unless revalidated."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_no_root_user,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.sagemaker_notebook_instance_root_access_disabled
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_3" {
  title       = "ACSC-EE-ML2-5.3: Restrict administrative privileges ML2"
  description = "Privileged access to systems and applications is automatically disabled after 45 days of inactivity."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_no_root_user,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.sagemaker_notebook_instance_root_access_disabled
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_4" {
  title       = "ACSC-EE-ML2-5.4: Restrict administrative privileges ML2"
  description = "Privileged accounts (excluding privileged service accounts) are prevented from accessing the internet, email and web services."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_no_root_user,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.sagemaker_notebook_instance_root_access_disabled
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_5" {
  title       = "ACSC-EE-ML2-5.5: Restrict administrative privileges ML2"
  description = "Privileged users use separate privileged and unprivileged operating environments."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_no_root_user,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.sagemaker_notebook_instance_root_access_disabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_6" {
  title       = "ACSC-EE-ML2-5.6: Restrict administrative privileges ML2"
  description = "Privileged operating environments are not virtualised within unprivileged operating environments."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_no_root_user,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.sagemaker_notebook_instance_root_access_disabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_7" {
  title       = "ACSC-EE-ML2-5.7: Restrict administrative privileges ML2"
  description = "Unprivileged accounts cannot logon to privileged operating environments."

  children = [
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_iam_profile_attached,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_8" {
  title       = "ACSC-EE-ML2-5.8: Restrict administrative privileges ML2"
  description = "Privileged accounts (excluding local administrator accounts) cannot logon to unprivileged operating environments."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_no_root_user,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.sagemaker_notebook_instance_root_access_disabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_9" {
  title       = "ACSC-EE-ML2-5.9: Restrict administrative privileges ML2"
  description = "Unprivileged accounts cannot logon to privileged operating environments."

  children = [
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_iam_profile_attached,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_10" {
  title       = "ACSC-EE-ML2-5.10: Restrict administrative privileges ML2"
  description = "Credentials for local administrator accounts and service accounts are long, unique, unpredictable and managed."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_no_root_user,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.sagemaker_notebook_instance_root_access_disabled
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_11" {
  title       = "ACSC-EE-ML2-5.11: Restrict administrative privileges ML2"
  description = "Privileged access events are logged."

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

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_5_12" {
  title       = "ACSC-EE-ML2-5.12: Restrict administrative privileges ML2"
  description = "Privileged account and group management events are logged."

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

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_6" {
  title       = "ACSC-EE-ML2-6: Multi-factor authentication ML2"
  description = "Multi-factor authentication is enabled for all users and administrators."

  children = [
    benchmark.acsc_essential_eight_ml_2_6_2,
    benchmark.acsc_essential_eight_ml_2_6_3,
    benchmark.acsc_essential_eight_ml_2_6_4,
    benchmark.acsc_essential_eight_ml_2_6_5,
    benchmark.acsc_essential_eight_ml_2_6_6,
    benchmark.acsc_essential_eight_ml_2_6_7
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_6_2" {
  title       = "ACSC-EE-ML2-6.2: Patch operating systems ML2"
  description = "A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]
}

benchmark "acsc_essential_eight_ml_2_6_3" {
  title       = "ACSC-EE-ML2-6.3: Patch operating systems ML2"
  description = "A vulnerability scanner is used at least daily to identify missing patches or updates for security vulnerabilities in operating systems of internet-facing services."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]
}

benchmark "acsc_essential_eight_ml_2_6_4" {
  title       = "ACSC-EE-ML2-6.4: Patch operating systems ML2"
  description = "A vulnerability scanner is used at least weekly to identify missing patches or updates for security vulnerabilities in operating systems of workstations, servers and network devices."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]
}

benchmark "acsc_essential_eight_ml_2_6_5" {
  title       = "ACSC-EE-ML2-6.5: Patch operating systems ML2"
  description = "Patches, updates or vendor mitigations for security vulnerabilities in operating systems of Internet-facing services are applied within two weeks of release, or within 48 hours if an exploit exists."

  children = [
    control.ecs_service_fargate_using_latest_platform_version,
    control.eks_cluster_with_latest_kubernetes_version,
    control.elastic_beanstalk_environment_managed_updates_enabled,
    control.elasticache_cluster_auto_minor_version_upgrade_enabled,
    control.lambda_function_use_latest_runtime,
    control.opensearch_domain_updated_with_latest_service_software_version,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_6_6" {
  title       = "ACSC-EE-ML2-6.6: Patch operating systems ML2"
  description = "Patches, updates or vendor mitigations for security vulnerabilities in operating systems of workstations, servers and network devices are applied within two weeks of release."

  children = [
    control.ecs_service_fargate_using_latest_platform_version,
    control.eks_cluster_with_latest_kubernetes_version,
    control.elastic_beanstalk_environment_managed_updates_enabled,
    control.elasticache_cluster_auto_minor_version_upgrade_enabled,
    control.lambda_function_use_latest_runtime,
    control.opensearch_domain_updated_with_latest_service_software_version,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_6_7" {
  title       = "ACSC-EE-ML2-6.7: Patch operating systems ML2"
  description = "Operating systems that are no longer supported by vendors are replaced."

  children = [
    control.ecs_service_fargate_using_latest_platform_version,
    control.eks_cluster_with_latest_kubernetes_version,
    control.elastic_beanstalk_environment_managed_updates_enabled,
    control.elasticache_cluster_auto_minor_version_upgrade_enabled,
    control.lambda_function_use_latest_runtime,
    control.opensearch_domain_updated_with_latest_service_software_version,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_7" {
  title       = "ACSC-EE-ML2-7: Application control ML2"
  description = "Allowed and blocked execution events on workstations and internet-facing servers are logged."

  children = [
    benchmark.acsc_essential_eight_ml_2_7_1,
    benchmark.acsc_essential_eight_ml_2_7_4,
    benchmark.acsc_essential_eight_ml_2_7_5,
    benchmark.acsc_essential_eight_ml_2_7_6,
    benchmark.acsc_essential_eight_ml_2_7_7
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_7_1" {
  title       = "ACSC-EE-ML2-7.1: Multi-factor authentication ML2"
  description = "Multi-factor authentication is used by an organisation's users if they authenticate to their organisations internet-facing services."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_7_4" {
  title       = "ACSC-EE-ML2-7.4: Multi-factor authentication ML2"
  description = "Multi-factor authentication is enabled by default for non-organisational users (but users can choose to opt out) if they authenticate to an organisations internet-facing services."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_7_5" {
  title       = "ACSC-EE-ML2-7.5: Multi-factor authentication ML2"
  description = "Multi-factor authentication is used to authenticate privileged users of systems."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_7_6" {
  title       = "ACSC-EE-ML2-7.6: Multi-factor authentication ML2"
  description = "Multi-factor authentication uses either: something users have and something users know, or something users have that is unlocked by something users know or are."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_7_7" {
  title       = "ACSC-EE-ML2-7.7: Multi-factor authentication ML2"
  description = "Successful and unsuccessful multi-factor authentication events are logged."

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

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_8" {
  title       = "ACSC-EE-ML2-8: Daily backups ML2"
  description = "Backups are taken daily and retained for at least 7 days."

  children = [
    benchmark.acsc_essential_eight_ml_2_8_1,
    benchmark.acsc_essential_eight_ml_2_8_2,
    benchmark.acsc_essential_eight_ml_2_8_3,
    benchmark.acsc_essential_eight_ml_2_8_5,
    benchmark.acsc_essential_eight_ml_2_8_6,
    benchmark.acsc_essential_eight_ml_2_8_7,
    benchmark.acsc_essential_eight_ml_2_8_8
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_8_1" {
  title       = "ACSC-EE-ML2-8.1: Regular backups ML2"
  description = "Backups of important data, software and configuration settings are performed and retained with a frequency and retention timeframe in accordance with business continuity requirements."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.docdb_cluster_backup_retention_period_7_days,
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
    control.neptune_db_cluster_automated_backup_enabled,
    control.rds_db_cluster_aurora_backtracking_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_8_2" {
  title       = "ACSC-EE-ML2-8.2: Regular backups ML2"
  description = "Backups of important data, software and configuration settings are synchronised to enable restoration to a common point in time."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.docdb_cluster_backup_retention_period_7_days,
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
    control.neptune_db_cluster_automated_backup_enabled,
    control.rds_db_cluster_aurora_backtracking_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_8_3" {
  title       = "ACSC-EE-ML2-8.3: Regular backups ML2"
  description = "Backups of important data, software and configuration settings are retained in a secure and resilient manner."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.docdb_cluster_backup_retention_period_7_days,
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
    control.neptune_db_cluster_automated_backup_enabled,
    control.rds_db_cluster_aurora_backtracking_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_8_5" {
  title       = "ACSC-EE-ML2-8.5: Regular backups ML2"
  description = "Unprivileged accounts cannot access backups belonging to other accounts."

  children = [
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_user_in_group,
    control.opensearch_domain_fine_grained_access_enabled,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_8_6" {
  title       = "ACSC-EE-ML2-8.6: Regular backups ML2"
  description = "Privileged accounts (excluding backup administrator accounts) cannot access backups belonging to other accounts."

  children = [
    control.backup_recovery_point_manual_deletion_disabled,
    control.cloudtrail_bucket_not_public,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ebs_snapshot_not_publicly_restorable,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_no_root_user,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.emr_account_public_access_blocked,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.lambda_function_restrict_public_access,
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
    control.sagemaker_notebook_instance_root_access_disabled,
    control.ssm_document_prohibit_public_access
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

benchmark "acsc_essential_eight_ml_2_8_7" {
  title       = "ACSC-EE-ML2-8.7: Regular backups ML2"
  description = "Unprivileged accounts are prevented from modifying and deleting backups."

  children = [
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_user_in_group,
    control.opensearch_domain_fine_grained_access_enabled,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_2_8_8" {
  title       = "ACSC-EE-ML2-8.8: Regular backups ML2"
  description = "Privileged accounts (excluding backup administrator accounts) are prevented from modifying and deleting backups."

  children = [
    control.backup_recovery_point_manual_deletion_disabled,
    control.cloudtrail_bucket_not_public,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ebs_snapshot_not_publicly_restorable,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_no_root_user,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.emr_account_public_access_blocked,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.lambda_function_restrict_public_access,
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
    control.sagemaker_notebook_instance_root_access_disabled,
    control.ssm_document_prohibit_public_access
  ]

  tags = local.acsc_essential_eight_ml_2_common_tags
}

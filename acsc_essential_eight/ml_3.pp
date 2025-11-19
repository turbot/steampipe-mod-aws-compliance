locals {
  acsc_essential_eight_ml_3_common_tags = merge(local.acsc_essential_eight_common_tags, {
    maturity_level = "3"
  })
}

benchmark "acsc_essential_eight_ml_3" {
  title       = "ACSC Essential Eight Maturity Level 3"
  description = "The Essential Eight Maturity Model is a prioritised list of strategies to mitigate cyber security incidents. The model consists of 8 essential strategies that organisations can implement to protect their systems from a range of adversaries."

  children = [
    benchmark.acsc_essential_eight_ml_3_1,
    benchmark.acsc_essential_eight_ml_3_2,
    benchmark.acsc_essential_eight_ml_3_4,
    benchmark.acsc_essential_eight_ml_3_5,
    benchmark.acsc_essential_eight_ml_3_6,
    benchmark.acsc_essential_eight_ml_3_7,
    benchmark.acsc_essential_eight_ml_3_8
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_1" {
  title       = "ACSC-EE-ML3-1: Application control ML3"
  description = "Application control is implemented on workstations and servers."

  children = [
    benchmark.acsc_essential_eight_ml_3_1_6,
    benchmark.acsc_essential_eight_ml_3_1_7,
    benchmark.acsc_essential_eight_ml_3_1_8,
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_1_6" {
  title       = "ACSC-EE-ML3-1.6: Application control ML3"
  description = "Allowed and blocked execution events on workstations and servers are centrally logged."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.es_domain_audit_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_1_7" {
  title       = "ACSC-EE-ML3-1.7: Application control ML3"
  description = "Event logs are protected from unauthorised modification and deletion."

  children = [
    control.cloudtrail_bucket_not_public,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.s3_public_access_block_bucket
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_1_8" {
  title       = "ACSC-EE-ML3-1.8: Application control ML3"
  description = "Event logs are monitored for signs of compromise and actioned when any signs of compromise are detected."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_2" {
  title       = "ACSC-EE-ML3-2: Patch applications ML3"
  description = "All workstations and servers have the latest security-relevant patches applied."

  children = [
    benchmark.acsc_essential_eight_ml_3_2_2,
    benchmark.acsc_essential_eight_ml_3_2_9,
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_2_2" {
  title       = "ACSC-EE-ML3-2.2: Patch applications ML3"
  description = "A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_2_9" {
  title       = "ACSC-EE-ML3-2.9: Patch applications ML3"
  description = "Applications that are no longer supported by vendors are removed."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_4" {
  title       = "ACSC-EE-ML3-4: User application hardening ML3"
  description = "Web browsers do not process Java from the internet."

  children = [
    benchmark.acsc_essential_eight_ml_3_4_18
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_4_18" {
  title       = "ACSC-EE-ML3-4.18: User application hardening ML3"
  description = "Event logs are monitored for signs of compromise and actioned when any signs of compromise are detected."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5" {
  title       = "ACSC-EE-ML3-5: Restrict administrative privileges ML3"
  description = "Requests for privileged access to systems and applications are validated when first requested."

  children = [
    benchmark.acsc_essential_eight_ml_3_5_2,
    benchmark.acsc_essential_eight_ml_3_5_3,
    benchmark.acsc_essential_eight_ml_3_5_4,
    benchmark.acsc_essential_eight_ml_3_5_5,
    benchmark.acsc_essential_eight_ml_3_5_6,
    benchmark.acsc_essential_eight_ml_3_5_7,
    benchmark.acsc_essential_eight_ml_3_5_8,
    benchmark.acsc_essential_eight_ml_3_5_9,
    benchmark.acsc_essential_eight_ml_3_5_11,
    benchmark.acsc_essential_eight_ml_3_5_12,
    benchmark.acsc_essential_eight_ml_3_5_14,
    benchmark.acsc_essential_eight_ml_3_5_15,
    benchmark.acsc_essential_eight_ml_3_5_16,
    benchmark.acsc_essential_eight_ml_3_5_17
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_2" {
  title       = "ACSC-EE-ML3-5.2: Restrict administrative privileges ML3"
  description = "Privileged access is restricted to the minimum number of people required."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_3" {
  title       = "ACSC-EE-ML3-5.3: Restrict administrative privileges ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_4" {
  title       = "ACSC-EE-ML3-5.4: Restrict administrative privileges ML3"
  description = "Privileged access to systems and applications is limited to only what is required for users and services to undertake their duties."

  children = [
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_user_in_group,
    control.opensearch_domain_fine_grained_access_enabled,
    control.s3_bucket_policy_restricts_cross_account_permission_changes
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_5" {
  title       = "ACSC-EE-ML3-5.5: Restrict administrative privileges ML3"
  description = "Privileged accounts are prevented from accessing the internet, email and web services."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_6" {
  title       = "ACSC-EE-ML3-5.6: Restrict administrative privileges ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_7" {
  title       = "ACSC-EE-ML3-5.7: Restrict administrative privileges ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_8" {
  title       = "ACSC-EE-ML3-5.8: Restrict administrative privileges ML3"
  description = "Unprivileged accounts cannot logon to privileged operating environments."

  children = [
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_iam_profile_attached,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_9" {
  title       = "ACSC-EE-ML3-5.9: Restrict administrative privileges ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_11" {
  title       = "ACSC-EE-ML3-5.11: Restrict administrative privileges ML3"
  description = "Administrative activities are conducted through jump servers."

  children = [
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_iam_profile_attached,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags

}

benchmark "acsc_essential_eight_ml_3_5_12" {
  title       = "ACSC-EE-ML3-5.12: Restrict administrative privileges ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_14" {
  title       = "ACSC-EE-ML3-5.14: Restrict administrative privileges ML3"
  description = "Privileged access events are centrally logged."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.es_domain_audit_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_15" {
  title       = "ACSC-EE-ML3-5.15: Restrict administrative privileges ML3"
  description = "Privileged account and group management events are centrally logged."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.es_domain_audit_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_16" {
  title       = "ACSC-EE-ML3-5.16: Restrict administrative privileges ML3"
  description = "Event logs are protected from unauthorised modification and deletion."

  children = [
    control.cloudtrail_bucket_not_public,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.s3_public_access_block_bucket
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_5_17" {
  title       = "ACSC-EE-ML3-5.17: Restrict administrative privileges ML3"
  description = "Event logs are monitored for signs of compromise and actioned when any signs of compromise are detected."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_6" {
  title       = "ACSC-EE-ML3-6: Patch operating systems ML3"
  description = "An automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities."

  children = [
    benchmark.acsc_essential_eight_ml_3_6_2,
    benchmark.acsc_essential_eight_ml_3_6_3,
    benchmark.acsc_essential_eight_ml_3_6_4,
    benchmark.acsc_essential_eight_ml_3_6_5,
    benchmark.acsc_essential_eight_ml_3_6_6,
    benchmark.acsc_essential_eight_ml_3_6_7,
    benchmark.acsc_essential_eight_ml_3_6_8
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_6_2" {
  title       = "ACSC-EE-ML3-6.2: Patch operating systems ML3"
  description = "A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_6_3" {
  title       = "ACSC-EE-ML3-6.3: Patch operating systems ML3"
  description = "A vulnerability scanner is used at least daily to identify missing patches or updates for security vulnerabilities in operating systems of internet-facing services."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_6_4" {
  title       = "ACSC-EE-ML3-6.4: Patch operating systems ML3"
  description = "A vulnerability scanner is used at least weekly to identify missing patches or updates for security vulnerabilities in operating systems of workstations, servers and network devices."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_6_5" {
  title       = "ACSC-EE-ML3-6.5: Patch operating systems ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_6_6" {
  title       = "ACSC-EE-ML3-6.6: Patch operating systems ML3"
  description = "Patches, updates or vendor mitigations for security vulnerabilities in operating systems of workstations, servers and network devices are applied within two weeks of release, or within 48 hours if an exploit exists."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_6_7" {
  title       = "ACSC-EE-ML3-6.7: Patch operating systems ML3"
  description = "The latest release, or the previous release, of operating systems are used."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_6_8" {
  title       = "ACSC-EE-ML3-6.8: Patch operating systems ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7" {
  title       = "ACSC-EE-ML3-7: Restrict administrative privileges ML3"
  description = "Multi-factor authentication is used by an organisation's users if they authenticate to their organisations internet-facing services."

  children = [
    benchmark.acsc_essential_eight_ml_3_7_1,
    benchmark.acsc_essential_eight_ml_3_7_2,
    benchmark.acsc_essential_eight_ml_3_7_3,
    benchmark.acsc_essential_eight_ml_3_7_4,
    benchmark.acsc_essential_eight_ml_3_7_5,
    benchmark.acsc_essential_eight_ml_3_7_6,
    benchmark.acsc_essential_eight_ml_3_7_7,
    benchmark.acsc_essential_eight_ml_3_7_8,
    benchmark.acsc_essential_eight_ml_3_7_9,
    benchmark.acsc_essential_eight_ml_3_7_10
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_1" {
  title       = "ACSC-EE-ML3-7.1: Multi-factor authentication ML3"
  description = "Multi-factor authentication is used by an organisation's users if they authenticate to their organisations internet-facing services."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_2" {
  title       = "ACSC-EE-ML3-7.2: Multi-factor authentication ML3"
  description = "Multi-factor authentication is used by an organisations users if they authenticate to third-party internet-facing services that process, store or communicate their organisation's sensitive data."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_3" {
  title       = "ACSC-EE-ML3-7.3: Multi-factor authentication ML3"
  description = "Multi-factor authentication is enabled by default for non-organisational users (but users can choose to opt out) if they authenticate to an organisations internet-facing services."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_4" {
  title       = "ACSC-EE-ML3-7.4: Multi-factor authentication ML3"
  description = "Multi-factor authentication is enabled by default for non-organisational users (but users can choose to opt out) if they authenticate to an organisations internet-facing services."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_5" {
  title       = "ACSC-EE-ML3-7.5: Multi-factor authentication ML3"
  description = "Multi-factor authentication is used to authenticate privileged users of systems."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_6" {
  title       = "ACSC-EE-ML3-7.6: Multi-factor authentication ML3"
  description = "Multi-factor authentication is used to authenticate users accessing important data repositories."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_7" {
  title       = "ACSC-EE-ML3-7.7: Multi-factor authentication ML3"
  description = "Multi-factor authentication is phishing-resistant and uses either: something users have and something users know, or something users have that is unlocked by something users know or are."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_8" {
  title       = "ACSC-EE-ML3-7.8: Multi-factor authentication ML3"
  description = "Successful and unsuccessful multi-factor authentication events are centrally logged."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.es_domain_audit_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_9" {
  title       = "ACSC-EE-ML3-7.9: Multi-factor authentication ML3"
  description = "Event logs are protected from unauthorised modification and deletion."

  children = [
    control.cloudtrail_bucket_not_public,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.s3_public_access_block_bucket
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_7_10" {
  title       = "ACSC-EE-ML3-7.10: Multi-factor authentication ML3"
  description = "Event logs are monitored for signs of compromise and actioned when any signs of compromise are detected."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_8" {
  title       = "ACSC-EE-ML3-8: Regular backups ML3"
  description = "Backups of important data, software and configuration settings are performed and retained with a frequency and retention timeframe in accordance with business continuity requirements."

  children = [
    benchmark.acsc_essential_eight_ml_3_8_1,
    benchmark.acsc_essential_eight_ml_3_8_2,
    benchmark.acsc_essential_eight_ml_3_8_3,
    benchmark.acsc_essential_eight_ml_3_8_5,
    benchmark.acsc_essential_eight_ml_3_8_6,
    benchmark.acsc_essential_eight_ml_3_8_7,
    benchmark.acsc_essential_eight_ml_3_8_8,
  ]

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_8_1" {
  title       = "ACSC-EE-ML3-8.1: Regular backups ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags

}

benchmark "acsc_essential_eight_ml_3_8_2" {
  title       = "ACSC-EE-ML3-8.2: Regular backups ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags

}

benchmark "acsc_essential_eight_ml_3_8_3" {
  title       = "ACSC-EE-ML3-8.3: Regular backups ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags

}

benchmark "acsc_essential_eight_ml_3_8_5" {
  title       = "ACSC-EE-ML3-8.5: Regular backups ML3"
  description = "Unprivileged accounts cannot access backups belonging to other accounts, nor their own accounts."

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

  tags = local.acsc_essential_eight_ml_3_common_tags

}

benchmark "acsc_essential_eight_ml_3_8_6" {
  title       = "ACSC-EE-ML3-8.6: Regular backups ML3"
  description = "Privileged accounts (excluding backup administrator accounts) cannot access backups belonging to other accounts, nor their own accounts."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

benchmark "acsc_essential_eight_ml_3_8_7" {
  title       = "ACSC-EE-ML3-8.7: Regular backups ML3"
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

  tags = local.acsc_essential_eight_ml_3_common_tags

}

benchmark "acsc_essential_eight_ml_3_8_8" {
  title       = "ACSC-EE-ML3-8.8: Regular backups ML3"
  description = "Privileged accounts (including backup administrator accounts) are prevented from modifying and deleting backups during their retention period."

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

  tags = local.acsc_essential_eight_ml_3_common_tags
}

locals {
  acsc_essential_eight_ml_1_common_tags = merge(local.acsc_essential_eight_common_tags, {
    maturity_level = "1"
  })
}

benchmark "acsc_essential_eight_ml_1" {
  title       = "ACSC Essential Eight Maturity Level 1"
  description = "The availability category refers to the accessibility of information used by the entity’s systems, as well as the products or services provided to its customers."

  children = [
    benchmark.acsc_essential_eight_ml_1_2,
    benchmark.acsc_essential_eight_ml_1_5,
    benchmark.acsc_essential_eight_ml_1_6,
    benchmark.acsc_essential_eight_ml_1_7,
    benchmark.acsc_essential_eight_ml_1_8
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_2" {
  title       = "ACSC-EE-ML1-2: Patch applications ML1"
  description = "A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities."

  children = [
    benchmark.acsc_essential_eight_ml_1_2_5
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_2_5" {
  title       = "ACSC-EE-ML1-2.5: Patch applications ML1"
  description = "Patches, updates or vendor mitigations for security vulnerabilities in internet-facing services are applied within two weeks of release, or within 48 hours if an exploit exists."

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

benchmark "acsc_essential_eight_ml_1_5" {
  title       = "ACSC-EE-ML1-5: Restrict administrative privileges ML1"
  description = "The restriction of administrative privileges is the practice of limiting the number of privileged accounts and the extent of their access to systems and data."

  children = [
    benchmark.acsc_essential_eight_ml_1_5_2,
    benchmark.acsc_essential_eight_ml_1_5_3,
    benchmark.acsc_essential_eight_ml_1_5_4,
    benchmark.acsc_essential_eight_ml_1_5_5
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_5_2" {
  title       = "ACSC-EE-ML1-5.2: Restrict administrative privileges ML1"
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

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_5_3" {
  title       = "ACSC-EE-ML1-5.3: Restrict administrative privileges ML1"
  description = "Privileged users use separate privileged and unprivileged operating environments."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_no_root_user,
    control.eventbridge_custom_bus_resource_based_policy_attached,
    control.iam_root_user_no_access_keys,
    control.sagemaker_notebook_instance_root_access_disabled,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_5_4" {
  title       = "ACSC-EE-ML1-5.4: Restrict administrative privileges ML1"
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

benchmark "acsc_essential_eight_ml_1_5_5" {
  title       = "ACSC-EE-ML1-5.5: Restrict administrative privileges ML1"
  description = "Privileged accounts (excluding local administrator accounts) cannot logon to unprivileged operating environments."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_no_root_user,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.sagemaker_notebook_instance_root_access_disabled,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_6" {
  title       = "ACSC-EE-ML1-6: Patch operating systems ML1"
  description = "The patching of operating systems is the practice of applying patches, updates or vendor mitigations to security vulnerabilities in operating systems."

  children = [
    benchmark.acsc_essential_eight_ml_1_6_2,
    benchmark.acsc_essential_eight_ml_1_6_3,
    benchmark.acsc_essential_eight_ml_1_6_4,
    benchmark.acsc_essential_eight_ml_1_6_5,
    benchmark.acsc_essential_eight_ml_1_6_6,
    benchmark.acsc_essential_eight_ml_1_6_7
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_6_2" {
  title       = "ACSC-EE-ML1-6.2: Patch operating systems ML1"
  description = "A vulnerability scanner with an up-to-date vulnerability database is used for vulnerability scanning activities."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_6_3" {
  title       = "ACSC-EE-ML1-6.3: Patch operating systems ML1"
  description = "A vulnerability scanner is used at least daily to identify missing patches or updates for security vulnerabilities in operating systems of internet-facing services."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_6_4" {
  title       = "ACSC-EE-ML1-6.4: Patch operating systems ML1"
  description = "A vulnerability scanner is used at least fortnightly to identify missing patches or updates for security vulnerabilities in operating systems of workstations, servers and network devices."

  children = [
    control.ecr_repository_image_scan_on_push_enabled
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_6_5" {
  title       = "ACSC-EE-ML1-6.5: Patch operating systems ML1"
  description = "Patches, updates or vendor mitigations for security vulnerabilities in operating systems of internet-facing services are applied within two weeks of release, or within 48 hours if an exploit exists."

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

benchmark "acsc_essential_eight_ml_1_6_6" {
  title       = "ACSC-EE-ML1-6.6: Patch operating systems ML1"
  description = "Patches, updates or vendor mitigations for security vulnerabilities in operating systems of workstations, servers and network devices are applied within one month of release."

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

benchmark "acsc_essential_eight_ml_1_6_7" {
  title       = "ACSC-EE-ML1-6.7: Patch operating systems ML1"
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

benchmark "acsc_essential_eight_ml_1_7" {
  title       = "ACSC-EE-ML1-7: Application control ML1"
  description = "Application control is the practice of restricting the execution of applications to those that have been authorised and are known to be secure."

  children = [
    benchmark.acsc_essential_eight_ml_1_7_1,
    benchmark.acsc_essential_eight_ml_1_7_2,
    benchmark.acsc_essential_eight_ml_1_7_3,
    benchmark.acsc_essential_eight_ml_1_7_4
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_7_1" {
  title       = "ACSC-EE-ML1-7.1: Multi-factor authentication ML1"
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

benchmark "acsc_essential_eight_ml_1_7_2" {
  title       = "ACSC-EE-ML1-7.2: Multi-factor authentication ML1"
  description = "Multi-factor authentication is used by an organisations users if they authenticate to third-party internet-facing services that process, store or communicate their organisation's sensitive data."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_7_3" {
  title       = "ACSC-EE-ML1-7.3: Multi-factor authentication ML1"
  description = "Multi-factor authentication (where available) is used by an organisations users if they authenticate to third-party internet-facing services that process, store or communicate their organisation's non-sensitive data."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_7_4" {
  title       = "ACSC-EE-ML1-7.4: Multi-factor authentication ML1"
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

benchmark "acsc_essential_eight_ml_1_8" {
  title       = "ACSC-EE-ML1-8: Regular backups ML1"
  description = "Regular backups of important data, software and configuration settings are performed and retained with a frequency and retention timeframe in accordance with business continuity requirements."

  children = [
    benchmark.acsc_essential_eight_ml_1_8_1,
    benchmark.acsc_essential_eight_ml_1_8_2,
    benchmark.acsc_essential_eight_ml_1_8_3,
    benchmark.acsc_essential_eight_ml_1_8_5,
    benchmark.acsc_essential_eight_ml_1_8_6
  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_8_1" {
  title       = "ACSC-EE-ML1-8.1: Regular backups ML1"
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

benchmark "acsc_essential_eight_ml_1_8_2" {
  title       = "ACSC-EE-ML1-8.2: Regular backups ML1"
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

benchmark "acsc_essential_eight_ml_1_8_3" {
  title       = "ACSC-EE-ML1-8.3: Regular backups ML1"
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

benchmark "acsc_essential_eight_ml_1_8_5" {
  title       = "ACSC-EE-ML1-8.5: Regular backups ML1"
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

benchmark "acsc_essential_eight_ml_1_8_6" {
  title       = "ACSC-EE-ML1-8.6: Regular backups ML1"
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
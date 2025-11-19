locals {
  pci_dss_v40_requirement_7_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "7"
  })
}

benchmark "pci_dss_v40_requirement_7" {
  title       = "Requirement 7: Restrict Access to System Components and Cardholder Data by Business Need to Know"
  description = "Unauthorized individuals may gain access to critical data or systems due to ineffective access control rules and definitions. To ensure critical data can only be accessed by authorized personnel, systems and processes must be in place to limit access based on need to know and according to job responsibilities."
  children = [
    benchmark.pci_dss_v40_requirement_7_2,
    benchmark.pci_dss_v40_requirement_7_3
  ]

  tags = local.pci_dss_v40_requirement_7_common_tags
}

benchmark "pci_dss_v40_requirement_7_2" {
  title       = "7.2: Access to system components and data is appropriately defined and assigned"

  children = [
    benchmark.pci_dss_v40_requirement_7_2_1,
    benchmark.pci_dss_v40_requirement_7_2_2,
    benchmark.pci_dss_v40_requirement_7_2_3,
    benchmark.pci_dss_v40_requirement_7_2_4,
    benchmark.pci_dss_v40_requirement_7_2_5,
    benchmark.pci_dss_v40_requirement_7_2_6
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.2"
  })
}

benchmark "pci_dss_v40_requirement_7_2_1" {
  title       = "7.2.1: An access control model is defined and includes granting access"
  description = "Defining an access control model that is appropriate for the entity's technology and access control philosophy supports a consistent and uniform way of allocating access and reduces the possibility of errors such as the granting of excessive rights."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_no_root_user,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.sagemaker_notebook_instance_root_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_flow_logs_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.2.1"
  })
}

benchmark "pci_dss_v40_requirement_7_2_2" {
  title       = "7.2.2: Access is assigned to users, including privileged users"
  description = "Assigning least privileges helps prevent users without sufficient knowledge about the application from incorrectly or accidentally changing application configuration or altering its security settings. Enforcing least privilege also helps to minimize the scope of damage if an unauthorized person gains access to a user ID."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_no_root_user,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.sagemaker_notebook_instance_root_access_disabled
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.2.2"
  })
}

benchmark "pci_dss_v40_requirement_7_2_3" {
  title       = "7.2.3: Required privileges are approved by authorized personnel"
  description = "Documented approval (for example, in writing or electronically) assures that those with access and privileges are known and authorized by management, and that their access is necessary for their job function."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_no_root_user,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.sagemaker_notebook_instance_root_access_disabled
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.2.3"
  })
}

benchmark "pci_dss_v40_requirement_7_2_4" {
  title       = "7.2.4: All user accounts and related access privileges, including third-party/vendor accounts, are reviewed"
  description = "Regular review of access rights helps to detect excessive access rights remaining after user job responsibilities change, system functions change, or other modifications. If excessive user rights are not revoked in due time, they may be used by malicious users for unauthorized access."

  children = [
    control.iam_group_not_empty,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.2.4"
  })
}

benchmark "pci_dss_v40_requirement_7_2_5" {
  title       = "7.2.5: All application and system accounts and related access privileges are assigned and managed"
  description = "It is important to establish the appropriate access level for application or system accounts. If such accounts are compromised, malicious users will receive the same access level as that granted to the application or system."

  children = [
    benchmark.pci_dss_v40_requirement_7_2_5_1,
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.2.5"
  })
}

benchmark "pci_dss_v40_requirement_7_2_5_1" {
  title       = "7.2.5.1: All access by application and system accounts and related access privileges are reviewed"
  description = "Regular review of access rights helps to detect excessive access rights remaining after system functions change, or other application or system modifications occur. If excessive rights are not removed when no longer needed, they may be used by malicious users for unauthorized access."

  children = [
    control.iam_group_not_empty,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.2.5.1"
  })
}

benchmark "pci_dss_v40_requirement_7_2_6" {
  title       = "7.2.6: All user access to query repositories of stored cardholder data"
  description = "The misuse of query access to repositories of cardholder data has been a regular cause of data breaches. Limiting such access to administrators reduces the risk of such access being abused by unauthorized users."

  children = [
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_user_in_group,
    control.opensearch_domain_fine_grained_access_enabled,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.2.6"
  })
}

benchmark "pci_dss_v40_requirement_7_3" {
  title       = "7.3: Access to system components and data is managed via an access control system(s)"

  children = [
    benchmark.pci_dss_v40_requirement_7_3_1,
    benchmark.pci_dss_v40_requirement_7_3_2,
    benchmark.pci_dss_v40_requirement_7_3_3
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.3"
  })
}

benchmark "pci_dss_v40_requirement_7_3_1" {
  title       = "7.3.1: An access control system(s) is in place that restricts access based on a user's need to know and covers all system components"
  description = "Without a mechanism to restrict access based on user's need to know, a user may unknowingly be granted access to cardholder data. Access control systems automate the process of restricting access and assigning privileges."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.secretsmanager_secret_unused_90_day,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.3.1"
  })
}

benchmark "pci_dss_v40_requirement_7_3_2" {
  title       = "7.3.2: The access control system(s) is configured to enforce permissions assigned to individuals, applications, and systems based on job classification and function"
  description = "Restricting privileged access with an access control system reduces the opportunity for errors in the assignment of permissions to individuals, applications, and systems."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.3.2"
  })
}

benchmark "pci_dss_v40_requirement_7_3_3" {
  title       = "7.3.3: The access control system(s) is set to “deny all” by default"
  description = "A default setting of 'deny all' ensures no one is granted access unless a rule is established specifically granting such access."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.securityhub_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_7_common_tags, {
    pci_dss_v40_item_id = "7.3.3"
  })
}
locals {
  pci_dss_v400_requirement_7_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "7"
  })
}

benchmark "pci_dss_v400_requirement_7" {
  title = "Requirement 7: Restrict Access to System Components and Cardholder Data by Business Need to Know"

  children = [
    benchmark.pci_dss_v400_requirement_7_2,
    benchmark.pci_dss_v400_requirement_7_3
  ]

  tags = local.pci_dss_v400_requirement_7_common_tags
}

benchmark "pci_dss_v400_requirement_7_2" {
  title = "7.2: Establish an Access Control System"

  children = [
    benchmark.pci_dss_v400_requirement_7_2_1,
    benchmark.pci_dss_v400_requirement_7_2_2,
    benchmark.pci_dss_v400_requirement_7_2_3,
    benchmark.pci_dss_v400_requirement_7_2_4,
    benchmark.pci_dss_v400_requirement_7_2_5,
    benchmark.pci_dss_v400_requirement_7_2_6
  ]

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.2"
  })
}

benchmark "pci_dss_v400_requirement_7_2_1" {
  title       = "7.2.1: An access control system is in place that restricts access based on a user's need to know."
  description = "An access control system is in place that restricts access based on a user's need to know, and is set to 'deny all' unless specifically allowed."

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
    control.iam_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
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

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.2.1"
  })
}

benchmark "pci_dss_v400_requirement_7_2_2" {
  title       = "7.2.2: The access control system(s) includes one or more of these requirements."
  description = "The access control system(s) includes one or more of these requirements: Role-based access control (RBAC), Discretionary access control (DAC), Mandatory access control (MAC), or Attribute-based access control (ABAC)."

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
    control.iam_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
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

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.2.2"
  })
}

benchmark "pci_dss_v400_requirement_7_2_3" {
  title       = "7.2.3: Default accounts and credentials are managed."
  description = "Default accounts and credentials are managed as follows: Default accounts that are not needed are disabled or removed, Default accounts that are needed are renamed (where possible), and Default passwords for needed default accounts are changed, and default passwords for removed/disabled accounts are removed/disabled."

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

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.2.3"
  })
}

benchmark "pci_dss_v400_requirement_7_2_4" {
  title       = "7.2.4: Access to privileged user IDs is restricted."
  description = "Access to privileged user IDs is restricted as follows: To the minimum number of privileges necessary to perform job responsibilities, To only authorized personnel with a legitimate, business-related need."

  children = [
    control.iam_group_not_empty,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.2.4"
  })
}

benchmark "pci_dss_v400_requirement_7_2_5" {
  title       = "7.2.5: Access to application/system accounts and related access privileges is managed."
  description = "Access to application/system accounts and related access privileges is managed as follows: Based on the principle of least privilege and least functionality, Assigned only to authorized personnel with a legitimate, business-related need, and according to Requirement 7.2.5.1."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
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

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.2.5"
  })
}

benchmark "pci_dss_v400_requirement_7_2_5_1" {
  title       = "7.2.5.1: All application and system accounts and related access privileges are assigned and managed in accordance with the entity's access control system(s)."
  description = "All application and system accounts and related access privileges are assigned and managed in accordance with the entity's access control system(s)."

  children = [
    control.iam_group_not_empty,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.2.5.1"
  })
}

benchmark "pci_dss_v400_requirement_7_2_6" {
  title       = "7.2.6: Access to any database containing cardholder data is restricted."
  description = "Access to any database containing cardholder data is restricted to only necessary users and applications."

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

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.2.6"
  })
}

benchmark "pci_dss_v400_requirement_7_3" {
  title = "7.3: Review Access Needs for Users and System Components"

  children = [
    benchmark.pci_dss_v400_requirement_7_3_1,
    benchmark.pci_dss_v400_requirement_7_3_2,
    benchmark.pci_dss_v400_requirement_7_3_3
  ]

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.3"
  })
}

benchmark "pci_dss_v400_requirement_7_3_1" {
  title       = "7.3.1: User access is authorized before access is granted to system components and cardholder data."
  description = "User access is authorized before access is granted to system components and cardholder data."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
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

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.3.1"
  })
}

benchmark "pci_dss_v400_requirement_7_3_2" {
  title       = "7.3.2: Access of users to system components and cardholder data is assigned based on job classification and function."
  description = "Access of users to system components and cardholder data is assigned based on job classification and function."

  children = [
    control.account_part_of_organizations,
    control.backup_recovery_point_manual_deletion_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
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

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.3.2"
  })
}

benchmark "pci_dss_v400_requirement_7_3_3" {
  title       = "7.3.3: All access is reviewed at least once every six months."
  description = "All access is reviewed at least once every six months to ensure individuals have appropriate access based on job responsibilities."

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
    control.iam_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
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

  tags = merge(local.pci_dss_v400_requirement_7_common_tags, {
    pci_dss_v400_item_id = "7.3.3"
  })
} 
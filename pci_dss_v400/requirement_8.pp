locals {
  pci_dss_v400_requirement_8_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "8"
  })
}

benchmark "pci_dss_v400_requirement_8" {
  title = "Requirement 8: Identify Users and Authenticate Access to System Components"

  children = [
    benchmark.pci_dss_v400_requirement_8_2,
    benchmark.pci_dss_v400_requirement_8_3,
    benchmark.pci_dss_v400_requirement_8_4,
    benchmark.pci_dss_v400_requirement_8_6
  ]

  tags = local.pci_dss_v400_requirement_8_common_tags
}

benchmark "pci_dss_v400_requirement_8_2" {
  title = "8.2: Use Unique ID, Strong Authentication and Multi-Factor Authentication"

  children = [
    benchmark.pci_dss_v400_requirement_8_2_1,
    benchmark.pci_dss_v400_requirement_8_2_2,
    benchmark.pci_dss_v400_requirement_8_2_4,
    benchmark.pci_dss_v400_requirement_8_2_5,
    benchmark.pci_dss_v400_requirement_8_2_6,
    benchmark.pci_dss_v400_requirement_8_2_7,
    benchmark.pci_dss_v400_requirement_8_2_8
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.2"
  })
}

benchmark "pci_dss_v400_requirement_8_2_1" {
  title       = "8.2.1: User identification and related accounts for users and administrators are uniquely identifiable."
  description = "User identification and related accounts for users and administrators are uniquely identifiable."

  children = [
    control.ec2_instance_no_amazon_key_pair,
    control.iam_group_not_empty,
    control.iam_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.2.1"
  })
}

benchmark "pci_dss_v400_requirement_8_2_2" {
  title       = "8.2.2: Strong authentication is provided for access to all accounts used by personnel, applications, and systems."
  description = "Strong authentication is provided for access to all accounts used by personnel, applications, and systems."

  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.ec2_instance_no_amazon_key_pair,
    control.ecs_task_definition_container_environment_no_secret,
    control.iam_group_not_empty,
    control.iam_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_last_changed_90_day,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.2.2"
  })
}

benchmark "pci_dss_v400_requirement_8_2_4" {
  title       = "8.2.4: Group, shared, or generic accounts, or other shared authentication credentials are prohibited."
  description = "Group, shared, or generic accounts, or other shared authentication credentials are prohibited."

  children = [
    control.ec2_instance_no_amazon_key_pair,
    control.iam_group_not_empty,
    control.iam_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.2.4"
  })
}

benchmark "pci_dss_v400_requirement_8_2_5" {
  title       = "8.2.5: Multi-factor authentication is required for all access into the CDE."
  description = "Multi-factor authentication is required for all access into the CDE."

  children = [
    control.ec2_instance_no_amazon_key_pair,
    control.iam_group_not_empty,
    control.iam_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.2.5"
  })
}

benchmark "pci_dss_v400_requirement_8_2_6" {
  title       = "8.2.6: If passwords/passphrases are used as authentication factors to meet Requirement 8.3.6 for non-console access to system components, they are rendered unreadable during transmission and storage using strong cryptography."
  description = "If passwords/passphrases are used as authentication factors to meet Requirement 8.3.6 for non-console access to system components, they are rendered unreadable during transmission and storage using strong cryptography."

  children = [
    control.iam_group_not_empty,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.2.6"
  })
}

benchmark "pci_dss_v400_requirement_8_2_7" {
  title       = "8.2.7: Access to any database containing cardholder data is restricted."
  description = "Access to any database containing cardholder data is restricted as follows: All user access to, user queries of, and user actions on (e.g., move, copy, delete), the database through programmatic methods are only performed via programmatic methods that are reviewed and approved by management, and logged."

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
    control.iam_user_no_inline_attached_policies,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.2.7"
  })
}

benchmark "pci_dss_v400_requirement_8_2_8" {
  title       = "8.2.8: If application and system accounts are used by the entity for non-console access, the accounts are managed in accordance with all elements specified in Requirement 8.2.2."
  description = "If application and system accounts are used by the entity for non-console access, the accounts are managed in accordance with all elements specified in Requirement 8.2.2."

  children = [
    control.account_part_of_organizations,
    control.autoscaling_launch_config_requires_imdsv2,
    control.backup_recovery_point_manual_deletion_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_uses_imdsv2,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
    control.iam_user_no_inline_attached_policies,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.2.8"
  })
}

benchmark "pci_dss_v400_requirement_8_3" {
  title = "8.3: Secure All Authentication Factors"

  children = [
    benchmark.pci_dss_v400_requirement_8_3_2,
    benchmark.pci_dss_v400_requirement_8_3_4,
    benchmark.pci_dss_v400_requirement_8_3_5,
    benchmark.pci_dss_v400_requirement_8_3_6,
    benchmark.pci_dss_v400_requirement_8_3_7,
    benchmark.pci_dss_v400_requirement_8_3_9,
    benchmark.pci_dss_v400_requirement_8_3_10,
    benchmark.pci_dss_v400_requirement_8_3_11
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3"
  })
}

benchmark "pci_dss_v400_requirement_8_3_2" {
  title       = "8.3.2: Strong cryptography is used to render all authentication factors unreadable during transmission."
  description = "Strong cryptography is used to render all authentication factors unreadable during transmission."

  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.athena_workgroup_encryption_at_rest_enabled,
    control.backup_recovery_point_encryption_enabled,
    control.cloudfront_distribution_custom_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.codebuild_project_artifact_encryption_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_s3_logs_encryption_enabled,
    control.dax_cluster_encryption_at_rest_enabled,
    control.docdb_cluster_encryption_at_rest_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.dynamodb_table_encryption_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.ecs_task_definition_container_environment_no_secret,
    control.efs_file_system_encrypt_data_at_rest,
    control.eks_cluster_secrets_encrypted,
    control.elasticache_replication_group_encryption_at_rest_enabled,
    control.elasticache_replication_group_encryption_in_transit_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_kerberos_enabled,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.kinesis_stream_server_side_encryption_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.neptune_db_cluster_encryption_at_rest_enabled,
    control.neptune_db_cluster_snapshot_encryption_at_rest_enabled,
    control.opensearch_domain_encryption_at_rest_enabled,
    control.opensearch_domain_https_required,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk,
    control.sns_topic_encrypted_at_rest
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3.2"
  })
}

benchmark "pci_dss_v400_requirement_8_3_4" {
  title       = "8.3.4: Multi-factor authentication (MFA) is implemented for all non-console access into the CDE for personnel with administrative access."
  description = "Multi-factor authentication (MFA) is implemented for all non-console access into the CDE for personnel with administrative access."

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
    control.iam_user_no_inline_attached_policies,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3.4"
  })
}

benchmark "pci_dss_v400_requirement_8_3_5" {
  title       = "8.3.5: Multi-factor authentication (MFA) is implemented for all console access to the CDE for personnel with administrative access."
  description = "Multi-factor authentication (MFA) is implemented for all console access to the CDE for personnel with administrative access."

  children = [
    control.iam_user_access_key_age_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3.5"
  })
}

benchmark "pci_dss_v400_requirement_8_3_6" {
  title       = "8.3.6: If passwords/passphrases are used as authentication factors to meet Requirement 8.3.6 for non-console access to system components, they are rendered unreadable during transmission and storage using strong cryptography."
  description = "If passwords/passphrases are used as authentication factors to meet Requirement 8.3.6 for non-console access to system components, they are rendered unreadable during transmission and storage using strong cryptography."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3.6"
  })
}

benchmark "pci_dss_v400_requirement_8_3_7" {
  title       = "8.3.7: Individuals are prompted to change their password/passphrase at least once every 90 days."
  description = "Individuals are prompted to change their password/passphrase at least once every 90 days."

  children = [
    control.iam_user_access_key_age_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3.7"
  })
}

benchmark "pci_dss_v400_requirement_8_3_9" {
  title       = "8.3.9: If passwords/passphrases are used as authentication factors, the password/passphrase is changed if there is evidence or suspicion of compromise."
  description = "If passwords/passphrases are used as authentication factors, the password/passphrase is changed if there is evidence or suspicion of compromise."

  children = [
    control.iam_user_access_key_age_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3.9"
  })
}

benchmark "pci_dss_v400_requirement_8_3_10" {
  title = "8.3.10: Authentication Policies and Procedures for Users and Administrators"

  children = [
    benchmark.pci_dss_v400_requirement_8_3_10_1
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3.10"
  })
}

benchmark "pci_dss_v400_requirement_8_3_10_1" {
  title       = "8.3.10.1: Additional requirement for service providers only: If passwords/passphrases are used as the only authentication factor for customer user access to cardholder data, passwords/passphrases are rotated at least every 90 days."
  description = "Additional requirement for service providers only: If passwords/passphrases are used as the only authentication factor for customer user access to cardholder data, passwords/passphrases are rotated at least every 90 days."

  children = [
    control.iam_user_access_key_age_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3.10.1"
  })
}

benchmark "pci_dss_v400_requirement_8_3_11" {
  title       = "8.3.11: Where cryptography is used to render passwords/passphrases unreadable, key management procedures and processes are implemented and supported by documentation."
  description = "Where cryptography is used to render passwords/passphrases unreadable, key management procedures and processes are implemented and supported by documentation."

  children = [
    control.ec2_instance_no_amazon_key_pair,
    control.iam_group_not_empty,
    control.iam_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.3.11"
  })
}

benchmark "pci_dss_v400_requirement_8_4" {
  title = "8.4: Use Multi-Factor Authentication"

  children = [
    benchmark.pci_dss_v400_requirement_8_4_1,
    benchmark.pci_dss_v400_requirement_8_4_2,
    benchmark.pci_dss_v400_requirement_8_4_3
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.4"
  })
}

benchmark "pci_dss_v400_requirement_8_4_1" {
  title       = "8.4.1: MFA is implemented to secure all non-console administrative access to CDE."
  description = "MFA is implemented to secure all non-console administrative access to CDE."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.4.1"
  })
}

benchmark "pci_dss_v400_requirement_8_4_2" {
  title       = "8.4.2: MFA is implemented for all non-console access to the CDE for all personnel with administrative access."
  description = "MFA is implemented for all non-console access to the CDE for all personnel with administrative access."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.4.2"
  })
}

benchmark "pci_dss_v400_requirement_8_4_3" {
  title       = "8.4.3: MFA is implemented for all remote network access originating from outside the entity's network that could access or impact the CDE."
  description = "MFA is implemented for all remote network access originating from outside the entity's network that could access or impact the CDE."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.4.3"
  })
}

benchmark "pci_dss_v400_requirement_8_6" {
  title = "8.6: Document and Communicate Authentication Policies and Procedures"

  children = [
    benchmark.pci_dss_v400_requirement_8_6_3
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.6"
  })
}

benchmark "pci_dss_v400_requirement_8_6_3" {
  title       = "8.6.3: Authentication policies and procedures are documented, and communicated to all users."
  description = "Authentication policies and procedures are documented, in use, and known to all affected parties including all users with access to system components in the CDE."

  children = [
    control.iam_user_access_key_age_90,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v400_requirement_8_common_tags, {
    pci_dss_v400_item_id = "8.6.3"
  })
} 
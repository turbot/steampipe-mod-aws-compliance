locals {
  pci_dss_v40_requirement_8_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "8"
  })
}

benchmark "pci_dss_v40_requirement_8" {
  title       = "Requirement 8: Identify Users and Authenticate Access to System Components"
  description = "Identification of an individual or process on a computer system is conducted by associating an identity with a person or process through an identifier, such as a user, system, or application ID. These IDs (also referred to as “accounts”) fundamentally establish the identity of an individual or process by assigning unique identification to each person or process to distinguish one user or process from another. When each user or process can be uniquely identified, it ensures there is accountability for actions performed by that identity. When such accountability is in place, actions taken can be traced to known and authorized users and processes."

  children = [
    benchmark.pci_dss_v40_requirement_8_2,
    benchmark.pci_dss_v40_requirement_8_3,
    benchmark.pci_dss_v40_requirement_8_4,
    benchmark.pci_dss_v40_requirement_8_6
  ]

  tags = local.pci_dss_v40_requirement_8_common_tags
}

benchmark "pci_dss_v40_requirement_8_2" {
  title       = "8.2: User identification and related accounts for users and administrators are strictly managed throughout an account's lifecycle"

  children = [
    benchmark.pci_dss_v40_requirement_8_2_1,
    benchmark.pci_dss_v40_requirement_8_2_2,
    benchmark.pci_dss_v40_requirement_8_2_4,
    benchmark.pci_dss_v40_requirement_8_2_5,
    benchmark.pci_dss_v40_requirement_8_2_6,
    benchmark.pci_dss_v40_requirement_8_2_7,
    benchmark.pci_dss_v40_requirement_8_2_8
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.2"
  })
}

benchmark "pci_dss_v40_requirement_8_2_1" {
  title       = "8.2.1: All users are assigned a unique ID before access to system components or cardholder data is allowed"
  description = "The ability to trace actions performed on a computer system to an individual establishes accountability and traceability and is fundamental to establishing effective access controls."

  children = [
    control.ec2_instance_no_amazon_key_pair,
    control.iam_group_not_empty,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.2.1"
  })
}

benchmark "pci_dss_v40_requirement_8_2_2" {
  title       = "8.2.2: Group, shared, or generic IDs, or other shared authentication credentials are only used when necessary on an exception basis, and are managed"
  description = "Group, shared, or generic (or default) IDs are typically delivered with software or operating systems—for example, root or with privileges associated with a specific function, such as an administrator."

  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.ec2_instance_no_amazon_key_pair,
    control.ecs_task_definition_container_environment_no_secret,
    control.iam_group_not_empty,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_last_changed_90_day,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.2.2"
  })
}

benchmark "pci_dss_v40_requirement_8_2_4" {
  title       = "8.2.4: Addition, deletion, and modification of user IDs, authentication factors, and other identifier objects are managed"
  description = "It is imperative that the lifecycle of a user ID (additions, deletions, and modifications) is controlled so that only authorized accounts can perform functions, actions are auditable, and privileges are limited to only what is required."

  children = [
    control.ec2_instance_no_amazon_key_pair,
    control.iam_group_not_empty,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.2.4"
  })
}

benchmark "pci_dss_v40_requirement_8_2_5" {
  title       = "8.2.5: Access for terminated users is immediately revoked"
  description = "If an employee or third party/vendor has left the company and still has access to the network via their user account, unnecessary or malicious access to cardholder data could occur—either by the former employee or by a malicious user who exploits the old and/or unused account."

  children = [
    control.ec2_instance_no_amazon_key_pair,
    control.iam_group_not_empty,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.2.5"
  })
}

benchmark "pci_dss_v40_requirement_8_2_6" {
  title       = "8.2.6: Inactive user accounts are removed or disabled within 90 days of inactivity"
  description = "Accounts that are not used regularly are often targets of attack since it is less likely that any changes, such as a changed password, will be noticed. As such, these accounts may be more easily exploited and used to access cardholder data."

  children = [
    control.iam_group_not_empty,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.2.6"
  })
}

benchmark "pci_dss_v40_requirement_8_2_7" {
  title       = "8.2.7: Accounts used by third parties to access, support, or maintain system components via remote access are managed"
  description = "Allowing third parties to have 24/7 access into an entity's systems and networks in case they need to provide support increases the chances of unauthorized access."

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
    control.iam_user_no_inline_attached_policies,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.2.7"
  })
}

benchmark "pci_dss_v40_requirement_8_2_8" {
  title       = "8.2.8: If a user session has been idle for more than 15 minutes, the user is required to re-authenticate to re-activate the terminal or session"
  description = "When users walk away from an open machine with access to system components or cardholder data, there is a risk that the machine may be used by others in the user's absence, resulting in unauthorized account access and/or misuse."

  children = [
    control.account_part_of_organizations,
    control.autoscaling_launch_config_requires_imdsv2,
    control.backup_recovery_point_manual_deletion_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_uses_imdsv2,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_user_no_inline_attached_policies,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.2.8"
  })
}

benchmark "pci_dss_v40_requirement_8_3" {
  title       = "8.3: Strong authentication for users and administrators is established and managed"

  children = [
    benchmark.pci_dss_v40_requirement_8_3_2,
    benchmark.pci_dss_v40_requirement_8_3_4,
    benchmark.pci_dss_v40_requirement_8_3_5,
    benchmark.pci_dss_v40_requirement_8_3_6,
    benchmark.pci_dss_v40_requirement_8_3_7,
    benchmark.pci_dss_v40_requirement_8_3_9,
    benchmark.pci_dss_v40_requirement_8_3_10,
    benchmark.pci_dss_v40_requirement_8_3_11
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3"
  })
}

benchmark "pci_dss_v40_requirement_8_3_2" {
  title       = "8.3.2: Strong cryptography is used to render all authentication factors unreadable during transmission and storage on all system components"
  description = "Network devices and applications have been known to transmit unencrypted, readable authentication factors (such as passwords and passphrases) across the network and/or store these values without encryption. As a result, a malicious individual can easily intercept this information during transmission using a 'sniffer,' or directly access unencrypted authentication factors in files where they are stored, and then use this data to gain unauthorized access."

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

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3.2"
  })
}

benchmark "pci_dss_v40_requirement_8_3_4" {
  title       = "8.3.4: Invalid authentication attempts are limited"
  description = "Without account-lockout mechanisms in place, an attacker can continually try to guess a password through manual or automated tools (for example, password cracking) until the attacker succeeds and gains access to a user's account."

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
    control.iam_user_no_inline_attached_policies,
    control.neptune_db_cluster_iam_authentication_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3.4"
  })
}

benchmark "pci_dss_v40_requirement_8_3_5" {
  title       = "8.3.5: If passwords/passphrases are used as authentication factors to meet Requirement 8.3.1, they are set and reset for each user"
  description = "If the same password/passphrase is used for every new user, an internal user, former employee, or malicious individual may know or easily discover the value and use it to gain access to accounts before the authorized user attempts to use the password."

  children = [
    control.iam_user_access_key_age_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3.5"
  })
}

benchmark "pci_dss_v40_requirement_8_3_6" {
  title       = "8.3.6: 6 If passwords/passphrases are used as authentication factors to meet Requirement 8.3.6, they meet the minimum level of complexity"
  description = "Strong passwords/passphrases may be the first line of defense into a network since a malicious individual will often first try to find accounts with weak, static, or non-existent passwords. If passwords are short or easily guessable, it is relatively easy for a malicious individual to find these weak accounts and compromise a network under the guise of a valid user ID."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3.6"
  })
}

benchmark "pci_dss_v40_requirement_8_3_7" {
  title       = "8.3.7: Individuals are not allowed to submit a new password/passphrase that is the same as any of the last four passwords/passphrases used"
  description = "If password history is not maintained, the effectiveness of changing passwords is reduced, as previous passwords can be reused over and over. Requiring that passwords cannot be reused for a period reduces the likelihood that passwords that have been guessed or brute-forced will be reused in the future."

  children = [
    control.iam_user_access_key_age_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3.7"
  })
}

benchmark "pci_dss_v40_requirement_8_3_9" {
  title       = "8.3.9: If passwords/passphrases are used as the only authentication factor for user access (i.e., in any single-factor authentication implementation)"
  description = "Access to in-scope system components that are not in the CDE may be provided using a single authentication factor, such as a password/passphrase, token device or smart card, or biometric attribute. Where passwords/passphrases are employed as the only authentication factor for such access, additional controls are required to protect the integrity of the password/passphrase."

  children = [
    control.iam_user_access_key_age_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3.9"
  })
}

benchmark "pci_dss_v40_requirement_8_3_10" {
  title       = "8.3.10: Additional requirement for service providers only: If passwords/passphrases are used as the only authentication factor for customer user access to cardholder data (i.e., in any singlefactor authentication implementation), then guidance is provided to customer users"
  description = "Using a password/passphrase as the only authentication factor provides a single point of failure if compromised. Therefore, in these implementations, controls are needed to minimize how long malicious activity could occur via a compromised password/passphrase."

  children = [
    benchmark.pci_dss_v40_requirement_8_3_10_1
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3.10"
  })
}

benchmark "pci_dss_v40_requirement_8_3_10_1" {
  title       = "8.3.10.1 Additional requirement for service providers only: If passwords/passphrases are used as the only authentication factor for customer user access (i.e., in any single-factor authentication implementation)"
  description = "Using a password/passphrase as the only authentication factor provides a single point of failure if compromised. Therefore, in these implementations, controls are needed to minimize how long malicious activity could occur via a compromised password/passphrase."

  children = [
    control.iam_user_access_key_age_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3.10.1"
  })
}

benchmark "pci_dss_v40_requirement_8_3_11" {
  title       = "8.3.11: Where authentication factors such as physical or logical security tokens, smart cards, or certificates"
  description = "If multiple users can use authentication factors such as tokens, smart cards, and certificates, it may be impossible to identify the individual using the authentication mechanism."

  children = [
    control.ec2_instance_no_amazon_key_pair,
    control.iam_group_not_empty,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.log_metric_filter_root_login
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.3.11"
  })
}

benchmark "pci_dss_v40_requirement_8_4" {
  title       = "8.4: Multi-factor authentication (MFA) is implemented to secure access into the CDE"

  children = [
    benchmark.pci_dss_v40_requirement_8_4_1,
    benchmark.pci_dss_v40_requirement_8_4_2,
    benchmark.pci_dss_v40_requirement_8_4_3
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.4"
  })
}

benchmark "pci_dss_v40_requirement_8_4_1" {
  title       = "8.4.1: MFA is implemented for all non-console access into the CDE for personnel with administrative access"
  description = "Requiring more than one type of authentication factor reduces the probability that an attacker can gain access to a system by masquerading as a legitimate user, because the attacker would need to compromise multiple authentication factors. This is especially true in environments where traditionally the single authentication factor employed was something a user knows such as a password or passphrase."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.4.1"
  })
}

benchmark "pci_dss_v40_requirement_8_4_2" {
  title       = "8.4.2 MFA is implemented for all non-console access into the CDE"
  description = "Requiring more than one type of authentication factor reduces the probability that an attacker can gain access to a system by masquerading as a legitimate user, because the attacker would need to compromise multiple authentication factors. This is especially true in environments where traditionally the single authentication factor employed was something a user knows such as a password or passphrase."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.4.2"
  })
}

benchmark "pci_dss_v40_requirement_8_4_3" {
  title       = "8.4.3 MFA is implemented for all remote access originating from outside the entity's network that could access or impact the CDE"
  description = "Requiring more than one type of authentication factor reduces the probability that an attacker can gain access to a system by masquerading as a legitimate user, because the attacker would need to compromise multiple authentication factors. This is especially true in environments where traditionally the single authentication factor employed was something a user knows, such as a password or passphrase."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.s3_bucket_mfa_delete_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.4.3"
  })
}

benchmark "pci_dss_v40_requirement_8_6" {
  title       = "8.6: Use of application and system accounts and associated authentication factors is strictly managed"

  children = [
    benchmark.pci_dss_v40_requirement_8_6_3
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.6"
  })
}

benchmark "pci_dss_v40_requirement_8_6_3" {
  title       = "8.6.3: 3 Passwords/passphrases for any application and system accounts are protected against misuse"
  description = "Systems and application accounts pose more inherent security risk than user accounts because they often run in an elevated security context, with access to systems that may not be typically granted to user accounts, such as programmatic access to databases, etc. As a result, special consideration must be made to protect passwords/passphrases used for application and system accounts."

  children = [
    control.iam_user_access_key_age_90,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v40_requirement_8_common_tags, {
    pci_dss_v40_item_id = "8.6.3"
  })
}
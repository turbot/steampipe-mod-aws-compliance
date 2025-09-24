locals {
  pci_dss_v321_requirement_8_common_tags = merge(local.pci_dss_v321_common_tags, {
    control_set = "8"
  })
}

benchmark "pci_dss_v321_requirement_8" {
  title       = "Requirement 8: Identify and authenticate access to system components"
  description = "Assigning a unique identification (ID) to each person with access ensures that each individual is uniquely accountable for their actions. When such accountability is in place, actions taken on critical data and systems are performed by, and can be traced to, known and authorized users and processes."

  children = [
    benchmark.pci_dss_v321_requirement_8_1,
    benchmark.pci_dss_v321_requirement_8_2,
    benchmark.pci_dss_v321_requirement_8_3,
    benchmark.pci_dss_v321_requirement_8_5,
    benchmark.pci_dss_v321_requirement_8_6,
    benchmark.pci_dss_v321_requirement_8_7
  ]

  tags = local.pci_dss_v321_requirement_8_common_tags
}

benchmark "pci_dss_v321_requirement_8_1" {
  title       = "8.1 Define and implement policies and procedures to ensure proper user identification management for non-consumer users and administrators"
  description = "By ensuring each user is uniquely identified— instead of using one ID for several employees—an organization can maintain individual responsibility for actions and an effective audit trail per employee. This will help speed issue resolution and containment when misuse or malicious intent occurs."

  children = [
    benchmark.pci_dss_v321_requirement_8_1_2,
    benchmark.pci_dss_v321_requirement_8_1_4,
    benchmark.pci_dss_v321_requirement_8_1_5
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.1"
  })
}

benchmark "pci_dss_v321_requirement_8_1_2" {
  title       = "8.1.2 Control addition, deletion, and modification of user IDs, credentials, and other identifier objects"
  description = "To ensure that user accounts granted access to systems are all valid and recognized users, strong processes must manage all changes to user IDs and other authentication credentials, including adding new ones and modifying or deleting existing ones."

  children = [
    control.log_metric_filter_iam_policy
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.1.2"
  })
}

benchmark "pci_dss_v321_requirement_8_1_4" {
  title       = "8.1.4 Observe user accounts to verify that any inactive accounts over 90 days old are either removed or disabled"
  description = "Accounts that are not used regularly are often targets of attack since it is less likely that any changes (such as a changed password) will be noticed. As such, these accounts may be more easily exploited and used to access cardholder data."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.1.4"
  })
}

benchmark "pci_dss_v321_requirement_8_1_5" {
  title       = "8.1.5 Manage IDs used by third parties to access, support, or maintain system components via remote access by enabling only during the time period needed and disabled when not in use"
  description = "Allowing vendors to have 24/7 access into your network in case they need to support your systems increases the chances of unauthorized access, either from a user in the vendor's environment or from a malicious individual who finds and uses this always-available external entry point into your network. Enabling access only for the time periods needed, and disabling it as soon as it is no longer needed, helps prevent misuse of these connections. Monitoring of vendor access provides assurance that vendors are accessing only the systems necessary and only during approved time frames."

  children = [
    benchmark.pci_dss_v321_requirement_8_1_5_a
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.1.5"
  })
}

benchmark "pci_dss_v321_requirement_8_1_5_a" {
  title       = "8.1.5.a Interview personnel and observe processes for managing accounts used by third parties to access, support, or maintain system components to verify that accounts used for remote access are disabled when not in use, enabled only when needed by the third party and disabled when not in use"
  description = "Allowing vendors to have 24/7 access into your network in case they need to support your systems increases the chances of unauthorized access, either from a user in the vendor's environment or from a malicious individual who finds and uses this always-available external entry point into your network. Enabling access only for the time periods needed, and disabling it as soon as it is no longer needed, helps prevent misuse of these connections. Monitoring of vendor access provides assurance that vendors are accessing only the systems necessary and only during approved time frames."

  children = [
    control.cloudtrail_trail_enabled,
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.1.5.a"
  })
}

benchmark "pci_dss_v321_requirement_8_2" {
  title       = "8.2 To verify that users are authenticated using unique ID and additional authentication (for example, a password/phrase) for access to the cardholder data environment perform the methods like examine documentation describing the authentication method(s) used etc"
  description = "Verify users are authenticated using unique ID, perform the following: examine documentation describing the authentication method(s) used, for each type of authentication method used and for each type of system component, observe an authentication to verify authentication is functioning consistent with documented authentication method(s). These authentication methods, when used in addition to unique IDs, help protect users' IDs from being compromised, since the one attempting the compromise needs to know both the unique ID and the password (or other authentication used). Note that a digital certificate is a valid option for “something you have” as long as it is unique for a particular user. Since one of the first steps a malicious individual will take to compromise a system is to exploit weak or nonexistent passwords, it is important to implement good processes for authentication management."

  children = [
    benchmark.pci_dss_v321_requirement_8_2_1,
    benchmark.pci_dss_v321_requirement_8_2_3,
    benchmark.pci_dss_v321_requirement_8_2_4,
    benchmark.pci_dss_v321_requirement_8_2_5,
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2"
  })
}

benchmark "pci_dss_v321_requirement_8_2_1" {
  title       = "8.2.1 Using strong cryptography, render all authentication credentials (such as passwords/phrases) unreadable during transmission and storage on all system components"
  description = "Many network devices and applications transmit unencrypted, readable passwords across the network and/or store passwords without encryption. A malicious individual can easily intercept unencrypted passwords during transmission using a “sniffer,” or directly access unencrypted passwords in files where they are stored, and use this data to gain unauthorized access. Note: Testing Procedures 8.2.1.d and 8.2.1.e are additional procedures that only apply if the entity being assessed is a service provider."

  children = [
    benchmark.pci_dss_v321_requirement_8_2_1_a,
    benchmark.pci_dss_v321_requirement_8_2_1_b,
    benchmark.pci_dss_v321_requirement_8_2_1_c,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.elb_application_lb_http_drop_invalid_header_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.1"
  })
}

benchmark "pci_dss_v321_requirement_8_2_1_a" {
  title       = "8.2.1.a Examine vendor documentation and system configuration settings to verify that passwords are protected with strong cryptography during transmission and storage"
  description = "Many network devices and applications transmit unencrypted, readable passwords across the network and/or store passwords without encryption. A malicious individual can easily intercept unencrypted passwords during transmission using a “sniffer,” or directly access unencrypted passwords in files where they are stored, and use this data to gain unauthorized access. Note: Testing Procedures 8.2.1.d and 8.2.1.e are additional procedures that only apply if the entity being assessed is a service provider."

  children = [
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dax_cluster_encryption_at_rest_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.dynamodb_table_encryption_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.eks_cluster_secrets_encrypted,
    control.elb_application_lb_http_drop_invalid_header_enabled,
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
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.1.a"
  })
}

benchmark "pci_dss_v321_requirement_8_2_1_b" {
  title       = "8.2.1.b For a sample of system components, examine password files to verify that passwords are unreadable during storage"
  description = "Many network devices and applications transmit unencrypted, readable passwords across the network and/or store passwords without encryption. A malicious individual can easily intercept unencrypted passwords during transmission using a “sniffer,” or directly access unencrypted passwords in files where they are stored, and use this data to gain unauthorized access. Note: Testing Procedures 8.2.1.d and 8.2.1.e are additional procedures that only apply if the entity being assessed is a service provider."

  children = [
    control.secretsmanager_secret_encrypted_with_kms_cmk
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.1.b"
  })
}

benchmark "pci_dss_v321_requirement_8_2_1_c" {
  title       = "8.2.1.c For a sample of system components, examine data transmissions to verify that passwords are unreadable during transmission"
  description = "Many network devices and applications transmit unencrypted, readable passwords across the network and/or store passwords without encryption. A malicious individual can easily intercept unencrypted passwords during transmission using a “sniffer,” or directly access unencrypted passwords in files where they are stored, and use this data to gain unauthorized access. Note: Testing Procedures 8.2.1.d and 8.2.1.e are additional procedures that only apply if the entity being assessed is a service provider."

  children = [
    control.secretsmanager_secret_encrypted_with_kms_cmk
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.1.c"
  })
}

benchmark "pci_dss_v321_requirement_8_2_3" {
  title       = "8.2.3 Passwords/passphrases require a minimum length of at least seven characters, contain both numeric and alphabetic characters"
  description = "The passwords/ passphrases must have complexity and strength at least equivalent to the parameters specified above. Strong passwords/passphrases are the first line of defense into a network since a malicious individual will often first try to find accounts with weak or non- existent passwords. If passwords are short or simple to guess, it is relatively easy for a malicious individual to find these weak accounts and compromise a network under the guise of a valid user ID. This requirement specifies that a minimum of seven characters and both numeric and alphabetic characters should be used for passwords/ passphrases. For cases where this minimum cannot be met due to technical limitations, entities can use “equivalent strength” to evaluate their alternative. For information on variability and equivalency of password strength (also referred to as entropy) for passwords/passphrases of different formats, refer to industry standards (e.g., the current version of NIST SP 800-63.) Note: Testing Procedure 8.2.3.b is an additional procedure that only applies if the entity being assessed is a service provider."

  children = [
    benchmark.pci_dss_v321_requirement_8_2_3_a,
    benchmark.pci_dss_v321_requirement_8_2_3_b,
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.3"
  })
}

benchmark "pci_dss_v321_requirement_8_2_3_a" {
  title       = "8.2.3.a For a sample of system components, inspect system configuration settings to verify that user password/passphrase parameters are set to require at least the following strength/complexity that is require a minimum length of at least seven characters and contain both numeric and alphabetic characters"
  description = "Strong passwords/passphrases are the first line of defense into a network since a malicious individual will often first try to find accounts with weak or non- existent passwords. If passwords are short or simple to guess, it is relatively easy for a malicious individual to find these weak accounts and compromise a network under the guise of a valid user ID. This requirement specifies that a minimum of seven characters and both numeric and alphabetic characters should be used for passwords/ passphrases. For cases where this minimum cannot be met due to technical limitations, entities can use “equivalent strength” to evaluate their alternative. For information on variability and equivalency of password strength (also referred to as entropy) for passwords/passphrases of different formats, refer to industry standards (e.g., the current version of NIST SP 800-63.) Note: Testing Procedure 8.2.3.b is an additional procedure that only applies if the entity being assessed is a service provider."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.3.a"
  })
}

benchmark "pci_dss_v321_requirement_8_2_3_b" {
  title       = "8.2.3.b Additional testing procedure for service provider assessments only to review internal processes and customer/user documentation to verify that non-consumer customer passwords/passphrases are required to meet at least the following strength/complexity that is require a minimum length of at least seven characters and contain both numeric and alphabetic characters"
  description = "Strong passwords/passphrases are the first line of defense into a network since a malicious individual will often first try to find accounts with weak or non- existent passwords. If passwords are short or simple to guess, it is relatively easy for a malicious individual to find these weak accounts and compromise a network under the guise of a valid user ID. This requirement specifies that a minimum of seven characters and both numeric and alphabetic characters should be used for passwords/ passphrases. For cases where this minimum cannot be met due to technical limitations, entities can use “equivalent strength” to evaluate their alternative. For information on variability and equivalency of password strength (also referred to as entropy) for passwords/passphrases of different formats, refer to industry standards (e.g., the current version of NIST SP 800-63.) Note: Testing Procedure 8.2.3.b is an additional procedure that only applies if the entity being assessed is a service provider."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.3.b"
  })
}

benchmark "pci_dss_v321_requirement_8_2_4" {
  title       = "8.2.4 Change user passwords/passphrases at least once every 90 days"
  description = "Passwords/passphrases that are valid for a long time without a change provide malicious individuals with more time to work on breaking the password/phrase. Note: Testing Procedure 8.2.4.b is an additional procedure that only applies if the entity being assessed is a service provider."

  children = [
    benchmark.pci_dss_v321_requirement_8_2_4_a,
    benchmark.pci_dss_v321_requirement_8_2_4_b,
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.4"
  })
}

benchmark "pci_dss_v321_requirement_8_2_4_a" {
  title       = "8.2.4.a For a sample of system components, inspect system configuration settings to verify that user password/passphrase parameters are set to require users to change passwords at least once every 90 days"
  description = "Passwords/passphrases that are valid for a long time without a change provide malicious individuals with more time to work on breaking the password/phrase. Note: Testing Procedure 8.2.4.b is an additional procedure that only applies if the entity being assessed is a service provider."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.secretsmanager_secret_last_changed_90_day
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.4.a"
  })
}

benchmark "pci_dss_v321_requirement_8_2_4_b" {
  title       = "8.2.4.b Additional testing procedure for service provider assessments only: Review internal processes and customer/user documentation to verify that non-consumer customer user passwords/passphrases are required to change periodically; and non-consumer customer users are given guidance as to when, and under what circumstances, passwords/passphrases must change"
  description = "Passwords/passphrases that are valid for a long time without a change provide malicious individuals with more time to work on breaking the password/phrase. Note: Testing Procedure 8.2.4.b is an additional procedure that only applies if the entity being assessed is a service provider."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.4.b"
  })
}

benchmark "pci_dss_v321_requirement_8_2_5" {
  title       = "8.2.5 Do not allow an individual to submit a new password/passphrase that is the same as any of the last four passwords/passphrases he or she has used"
  description = "If password history isn't maintained, the effectiveness of changing passwords is reduced, as previous passwords can be reused over and over. Requiring that passwords cannot be reused for a period of time reduces the likelihood that passwords that have been guessed or brute-forced will be used in the future. Note: Testing Procedure 8.2.5.b is an additional procedure that only applies if the entity being assessed is a service provider."

  children = [
    benchmark.pci_dss_v321_requirement_8_2_5_a,
    benchmark.pci_dss_v321_requirement_8_2_5_b,
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.5"
  })
}

benchmark "pci_dss_v321_requirement_8_2_5_a" {
  title       = "8.2.5.a For a sample of system components, obtain and inspect system configuration settings to verify that password parameters are set to require that new passwords/passphrases cannot be the same as the four previously used passwords/passphrases"
  description = "If password history isn't maintained, the effectiveness of changing passwords is reduced, as previous passwords can be reused over and over. Requiring that passwords cannot be reused for a period of time reduces the likelihood that passwords that have been guessed or brute-forced will be used in the future. Note: Testing Procedure 8.2.5.b is an additional procedure that only applies if the entity being assessed is a service provider."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.5.a"
  })
}

benchmark "pci_dss_v321_requirement_8_2_5_b" {
  title       = "8.2.5.b Additional testing procedure for service provider assessments only to review internal processes and customer/user documentation to verify that new non-consumer customer user passwords/passphrase cannot be the same as the previous four passwords"
  description = "If password history isn't maintained, the effectiveness of changing passwords is reduced, as previous passwords can be reused over and over. Requiring that passwords cannot be reused for a period of time reduces the likelihood that passwords that have been guessed or brute-forced will be used in the future. Note: Testing Procedure 8.2.5.b is an additional procedure that only applies if the entity being assessed is a service provider."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.2.5.b"
  })
}

benchmark "pci_dss_v321_requirement_8_3" {
  title       = "8.3 Secure all individual non-console administrative access and all remote access to the CDE using multi-factor authentication"
  description = "Note: Multi-factor authentication requires that a minimum of two of the three authentication methods (see Requirement 8.2 for descriptions of authentication methods) be used for authentication. Using one factor twice (for example, using two separate passwords) is not considered multi-factor authentication. Multi-factor authentication requires an individual to present a minimum of two separate forms of authentication (as described in Requirement 8.2), before access is granted. Multi-factor authentication provides additional assurance that the individual attempting to gain access is who they claim to be. With multi-factor authentication, an attacker would need to compromise at least two different authentication mechanisms, increasing the difficulty of compromise and thus reducing the risk. Multi-factor authentication is not required at both the system-level and application-level for a particular system component. Multi-factor authentication can be performed either upon authentication to the particular network or to the system component. Examples of multi-factor technologies include but are not limited to remote authentication and dial-in service (RADIUS) with tokens; terminal access controller access control system (TACACS) with tokens; and other technologies that facilitate multi- factor authentication."

  children = [
    benchmark.pci_dss_v321_requirement_8_3_1,
    benchmark.pci_dss_v321_requirement_8_3_2
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.3"
  })
}

benchmark "pci_dss_v321_requirement_8_3_1" {
  title       = "8.3.1 Incorporate multi-factor authentication for all non-console access into the CDE for personnel with administrative access"
  description = "This requirement is intended to apply to all personnel with administrative access to the CDE. This requirement applies only to personnel with administrative access and only for non-console access to the CDE; it does not apply to application or system accounts performing automated functions. If the entity does not use segmentation to separate the CDE from the rest of their network, an administrator could use multi-factor authentication either when logging onto the CDE network or when logging onto a system. If the CDE is segmented from the rest of the entity’s network, an administrator would need to use multi- factor authentication when connecting to a CDE system from a non-CDE network. Multi-factor authentication can be implemented at network level or at system/application level; it does not have to be both. If the administrator uses MFA when logging into the CDE network, they do not also need to use MFA to log into a particular system or application within the CDE."

  children = [
    benchmark.pci_dss_v321_requirement_8_3_1_a,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.3.1"
  })
}

benchmark "pci_dss_v321_requirement_8_3_1_a" {
  title       = "8.3.1.a Examine network and/or system configurations, as applicable, to verify multi-factor authentication is required for all non-console administrative access into the CDE"
  description = "This requirement is intended to apply to all personnel with administrative access to the CDE. This requirement applies only to personnel with administrative access and only for non-console access to the CDE; it does not apply to application or system accounts performing automated functions. If the entity does not use segmentation to separate the CDE from the rest of their network, an administrator could use multi-factor authentication either when logging onto the CDE network or when logging onto a system. If the CDE is segmented from the rest of the entity's network, an administrator would need to use multi- factor authentication when connecting to a CDE system from a non-CDE network. Multi-factor authentication can be implemented at network level or at system/application level; it does not have to be both. If the administrator uses MFA when logging into the CDE network, they do not also need to use MFA to log into a particular system or application within the CDE."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.3.1.a"
  })
}

benchmark "pci_dss_v321_requirement_8_3_2" {
  title       = "8.3.2 Incorporate multi-factor authentication for all remote network access (both user and administrator, and including third-party access for support or maintenance) originating from outside the entity's network"
  description = "This requirement is intended to apply to all personnel—including general users, administrators, and vendors (for support or maintenance) with remote access to the network—where that remote access could lead to access to the CDE. If remote access is to an entity's network that has appropriate segmentation, such that remote users cannot access or impact the cardholder data environment, multi-factor authentication for remote access to that network would not be required. However, multi- factor authentication is required for any remote access to networks with access to the cardholder data environment, and is recommended for all remote access to the entity's networks."

  children = [
    benchmark.pci_dss_v321_requirement_8_3_2_a
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.3.2"
  })
}

benchmark "pci_dss_v321_requirement_8_3_2_a" {
  title       = "8.3.2.a Examine system configurations for remote access servers and systems to verify multi-factor authentication is required for all remote access by personnel, both user and administrator, and all third-party/vendor remote access (including access to applications and system components for support or maintenance purposes)"
  description = "This requirement is intended to apply to all personnel—including general users, administrators, and vendors (for support or maintenance) with remote access to the network—where that remote access could lead to access to the CDE. If remote access is to an entity's network that has appropriate segmentation, such that remote users cannot access or impact the cardholder data environment, multi-factor authentication for remote access to that network would not be required. However, multi- factor authentication is required for any remote access to networks with access to the cardholder data environment, and is recommended for all remote access to the entity's networks."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.3.2.a"
  })
}

benchmark "pci_dss_v321_requirement_8_5" {
  title       = "8.5 Do not use group, shared, or generic IDs, passwords, or other authentication methods"
  description = "Generic user IDs are disabled or removed. Shared user IDs do not exist for system administration and other critical functions. Shared and generic user IDs are not used to administer any system components. If multiple users share the same authentication credentials (for example, user account and password), it becomes impossible to trace system access and activities to an individual. This in turn prevents an entity from assigning accountability for, or having effective logging of, an individual's actions, since a given action could have been performed by anyone in the group that has knowledge of the authentication credentials."

  children = [
    benchmark.pci_dss_v321_requirement_8_5_a
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.5"
  })
}

benchmark "pci_dss_v321_requirement_8_5_a" {
  title       = "8.5.a For a sample of system components, examine user ID lists to verify that generic user IDs are disabled or removed, shared user IDs for system administration activities and other critical functions do not exist or are shared, and generic user IDs are not used to administer any system components"
  description = "Generic user IDs are disabled or removed.  Shared user IDs for system administration activities and other critical functions do not exist.  Shared and generic user IDs are not used to administer any system components. If multiple users share the same authentication credentials (for example, user account and password), it becomes impossible to trace system access and activities to an individual. This in turn prevents an entity from assigning accountability for, or having effective logging of, an individual's actions, since a given action could have been performed by anyone in the group that has knowledge of the authentication credentials."

  children = [
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.5.a"
  })
}

benchmark "pci_dss_v321_requirement_8_6" {
  title       = "8.6 Where other authentication mechanisms are used (for example, physical or logical security tokens, smart cards, certificates, etc.), use of these mechanisms must be assigned authentication mechanisms must be assigned to an individual account and not shared among multiple accounts, physical and/or logical controls must be in place to ensure only the intended account can use that mechanism to gain access"
  description = "If user authentication mechanisms such as tokens, smart cards, and certificates can be used by multiple accounts, it may be impossible to identify the individual using the authentication mechanism. Having physical and/or logical controls (for example, a PIN, biometric data, or a password) to uniquely identify the user of the account will prevent unauthorized users from gaining access through use of a shared authentication mechanism."

  children = [
    benchmark.pci_dss_v321_requirement_8_6_c
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.6"
  })
}

benchmark "pci_dss_v321_requirement_8_6_c" {
  title       = "8.6.c Examine system configuration settings and/or physical controls, as applicable, to verify that controls are implemented to ensure only the intended account can use that mechanism to gain access"
  description = "If user authentication mechanisms such as tokens, smart cards, and certificates can be used by multiple accounts, it may be impossible to identify the individual using the authentication mechanism. Having physical and/or logical controls (for example, a PIN, biometric data, or a password) to uniquely identify the user of the account will prevent unauthorized users from gaining access through use of a shared authentication mechanism."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.6.c"
  })
}

benchmark "pci_dss_v321_requirement_8_7" {
  title       = "8.7 All access to any database containing cardholder data (including access by applications, administrators, and all other users) is restricted"
  description = "Access to any database containing cardholder data is restricted as follows: all user access to, user queries of, and user actions on databases are through programmatic methods. Only database administrators have the ability to directly access or query databases. Application IDs for database applications can only be used by the applications (and not by individual users or other non-application processes). Without user authentication for access to databases and applications, the potential for unauthorized or malicious access increases, and such access cannot be logged since the user has not been authenticated and is therefore not known to the system. Also, database access should be granted through programmatic methods only (for example, through stored procedures), rather than via direct access to the database by end users (except for DBAs, who may need direct access to the database for their administrative duties)."

  children = [
    benchmark.pci_dss_v321_requirement_8_7_a,
    benchmark.pci_dss_v321_requirement_8_7_b,
    benchmark.pci_dss_v321_requirement_8_7_c,
    benchmark.pci_dss_v321_requirement_8_7_d
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.7"
  })
}

benchmark "pci_dss_v321_requirement_8_7_a" {
  title       = "8.7.a Review database and application configuration settings and verify that all users are authenticated prior to access"
  description = "Without user authentication for access to databases and applications, the potential for unauthorized or malicious access increases, and such access cannot be logged since the user has not been authenticated and is therefore not known to the system. Also, database access should be granted through programmatic methods only (for example, through stored procedures), rather than via direct access to the database by end users (except for DBAs, who may need direct access to the database for their administrative duties)."

  children = [
    control.rds_db_instance_iam_authentication_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.7.a"
  })
}

benchmark "pci_dss_v321_requirement_8_7_b" {
  title       = "8.7.b Examine database and application configuration settings to verify that all user access to, user queries of, and user actions on (for example, move, copy, delete), the database are through programmatic methods only (for example, through stored procedures)"
  description = "Without user authentication for access to databases and applications, the potential for unauthorized or malicious access increases, and such access cannot be logged since the user has not been authenticated and is therefore not known to the system. Also, database access should be granted through programmatic methods only (for example, through stored procedures), rather than via direct access to the database by end users (except for DBAs, who may need direct access to the database for their administrative duties)."

  children = [
    control.rds_db_instance_iam_authentication_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.7.b"
  })
}

benchmark "pci_dss_v321_requirement_8_7_c" {
  title       = "8.7.c Examine database access control settings and database application configuration settings to verify that user direct access to or queries of databases are restricted to database administrators"
  description = "Without user authentication for access to databases and applications, the potential for unauthorized or malicious access increases, and such access cannot be logged since the user has not been authenticated and is therefore not known to the system. Also, database access should be granted through programmatic methods only (for example, through stored procedures), rather than via direct access to the database by end users (except for DBAs, who may need direct access to the database for their administrative duties)."

  children = [
    control.rds_db_instance_iam_authentication_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.7.c"
  })
}

benchmark "pci_dss_v321_requirement_8_7_d" {
  title       = "8.7.d Examine database access control settings, database application configuration settings, and the related application IDs to verify that application IDs can only be used by the applications (and not by individual users or other processes)"
  description = "Without user authentication for access to databases and applications, the potential for unauthorized or malicious access increases, and such access cannot be logged since the user has not been authenticated and is therefore not known to the system. Also, database access should be granted through programmatic methods only (for example, through stored procedures), rather than via direct access to the database by end users (except for DBAs, who may need direct access to the database for their administrative duties)."

  children = [
    control.rds_db_instance_iam_authentication_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_8_common_tags, {
    pci_dss_v321_item_id = "8.7.d"
  })
}

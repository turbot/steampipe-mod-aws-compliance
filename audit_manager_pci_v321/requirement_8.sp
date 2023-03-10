locals {
  audit_manager_pci_v321_requirement_8_common_tags = merge(local.audit_manager_pci_v321_common_tags, {
    control_set = "pci_v321_requirement_8"
  })
}

benchmark "audit_manager_pci_v321_requirement_8" {
  title       = "Requirement 8: Identify and authenticate access to system components"
  description = ""

  children = [
    benchmark.audit_manager_pci_v321_requirement_8_1,
    benchmark.audit_manager_pci_v321_requirement_8_2,
  ]

  tags = local.audit_manager_pci_v321_requirement_7_common_tags
}

benchmark "audit_manager_pci_v321_requirement_8_1" {
  title       = "8.1 Define and implement policies and procedures to ensure proper user identification management for non-consumer users and administrators"
  description = "By ensuring each user is uniquely identified— instead of using one ID for several employees—an organization can maintain individual responsibility for actions and an effective audit trail per employee. This will help speed issue resolution and containment when misuse or malicious intent occurs."

  children = [
    benchmark.audit_manager_pci_v321_requirement_8_1_4,
    benchmark.audit_manager_pci_v321_requirement_8_1_5,
  ]

  tags = local.audit_manager_pci_v321_requirement_8_common_tags
}

benchmark "audit_manager_pci_v321_requirement_8_1_4" {
  title       = "8.1.4 Observe user accounts to verify that any inactive accounts over 90 days old are either removed or disabled"
  description = "Accounts that are not used regularly are often targets of attack since it is less likely that any changes (such as a changed password) will be noticed. As such, these accounts may be more easily exploited and used to access cardholder data."

  children = [
    control.iam_user_unused_credentials_90,
    control.iam_account_password_policy_strong_min_reuse_24,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_8_common_tags, {
    audit_manager_pci_v321_item_id = "8.1.4"
  })
}

benchmark "audit_manager_pci_v321_requirement_8_1_5" {
  title       = "8.1.5 Manage IDs used by third parties to access, support, or maintain system components via remote access as follows: • Enabled only during the time period needed and disabled when not in use. • Monitored when in use"
  description = "Allowing vendors to have 24/7 access into your network in case they need to support your systems increases the chances of unauthorized access, either from a user in the vendor's environment or from a malicious individual who finds and uses this always-available external entry point into your network. Enabling access only for the time periods needed, and disabling it as soon as it is no longer needed, helps prevent misuse of these connections. Monitoring of vendor access provides assurance that vendors are accessing only the systems necessary and only during approved time frames."

  children = [
    benchmark.audit_manager_pci_v321_requirement_8_1_5_a,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_8_common_tags, {
    audit_manager_pci_v321_item_id = "8.1.5"
  })
}

benchmark "audit_manager_pci_v321_requirement_8_1_5_a" {
  title       = "8.1.5.a Interview personnel and observe processes for managing accounts used by third parties to access, support, or maintain system components to verify that accounts used for remote access are: • Disabled when not in use • Enabled only when needed by the third party, and disabled when not in use"
  description = "Allowing vendors to have 24/7 access into your network in case they need to support your systems increases the chances of unauthorized access, either from a user in the vendor's environment or from a malicious individual who finds and uses this always-available external entry point into your network. Enabling access only for the time periods needed, and disabling it as soon as it is no longer needed, helps prevent misuse of these connections. Monitoring of vendor access provides assurance that vendors are accessing only the systems necessary and only during approved time frames."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_8_common_tags, {
    audit_manager_pci_v321_item_id = "8.1.5.a"
  })
}

benchmark "audit_manager_pci_v321_requirement_8_2" {
  title       = "8.2 To verify that users are authenticated using unique ID and additional authentication (for example, a password/phrase) for access to the cardholder data environment, perform the following: • Examine documentation describing the authentication method(s) used. • For each type of authentication method used and for each type of system component, observe an authentication to verify authentication is functioning consistent with documented authentication method(s)"
  description = "These authentication methods, when used in addition to unique IDs, help protect users' IDs from being compromised, since the one attempting the compromise needs to know both the unique ID and the password (or other authentication used). Note that a digital certificate is a valid option for “something you have” as long as it is unique for a particular user. Since one of the first steps a malicious individual will take to compromise a system is to exploit weak or nonexistent passwords, it is important to implement good processes for authentication management."

  children = [
    control.iam_account_password_policy_strong,
    benchmark.audit_manager_pci_v321_requirement_8_2_1,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_8_common_tags, {
    audit_manager_pci_v321_item_id = "8.2"
  })
}

benchmark "audit_manager_pci_v321_requirement_8_2_1" {
  title       = "8.2.1 Using strong cryptography, render all authentication credentials (such as passwords/phrases) unreadable during transmission and storage on all system components"
  description = "Many network devices and applications transmit unencrypted, readable passwords across the network and/or store passwords without encryption. A malicious individual can easily intercept unencrypted passwords during transmission using a “sniffer,” or directly access unencrypted passwords in files where they are stored, and use this data to gain unauthorized access. Note: Testing Procedures 8.2.1.d and 8.2.1.e are additional procedures that only apply if the entity being assessed is a service provider."

  children = [
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.es_domain_node_to_node_encryption_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.s3_bucket_enforces_ssl,
    benchmark.audit_manager_pci_v321_requirement_8_2_1_a,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_8_common_tags, {
    audit_manager_pci_v321_item_id = "8.2.1"
  })
}

benchmark "audit_manager_pci_v321_requirement_8_2_1_a" {
  title       = "8.2.1.a Examine vendor documentation and system configuration settings to verify that passwords are protected with strong cryptography during transmission and storage"
  description = "Many network devices and applications transmit unencrypted, readable passwords across the network and/or store passwords without encryption. A malicious individual can easily intercept unencrypted passwords during transmission using a “sniffer,” or directly access unencrypted passwords in files where they are stored, and use this data to gain unauthorized access. Note: Testing Procedures 8.2.1.d and 8.2.1.e are additional procedures that only apply if the entity being assessed is a service provider."

  children = [
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.dax_cluster_encryption_at_rest_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.dynamodb_table_encryption_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypted_with_cmk,
    control.eks_cluster_secrets_encrypted,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.ebs_attached_volume_encryption_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_default_encryption_enabled_kms,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_8_common_tags, {
    audit_manager_pci_v321_item_id = "8.2.1.a"
  })
}


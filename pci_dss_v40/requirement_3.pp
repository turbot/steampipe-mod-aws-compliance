locals {
  pci_dss_v40_requirement_3_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "3"
  })
}

benchmark "pci_dss_v40_requirement_3" {
  title       = "Requirement 3: Protect Stored Account Data"
  description = "Protection methods such as encryption, truncation, masking, and hashing are critical components of account data protection. If an intruder circumvents other security controls and gains access to encrypted account data, the data is unreadable without the proper cryptographic keys and is unusable to that intruder. Other effective methods of protecting stored data should also be considered as potential risk-mitigation opportunities. For example, methods for minimizing risk include not storing account data unless necessary, truncating cardholder data if full PAN is not needed, and not sending unprotected PANs using end-user messaging technologies such as e-mail and instant messaging."

  children = [
    benchmark.pci_dss_v40_requirement_3_2,
    benchmark.pci_dss_v40_requirement_3_3,
    benchmark.pci_dss_v40_requirement_3_5,
    benchmark.pci_dss_v40_requirement_3_6,
    benchmark.pci_dss_v40_requirement_3_7
  ]

  tags = local.pci_dss_v40_requirement_3_common_tags
}

benchmark "pci_dss_v40_requirement_3_2" {
  title = "3.2: Storage of account data is kept to a minimum"

  children = [
    benchmark.pci_dss_v40_requirement_3_2_1,
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.2"
  })
}

benchmark "pci_dss_v40_requirement_3_2_1" {
  title       = "3.2.1: Account data storage is kept to a minimum through implementation of data retention and disposal policies, procedures, and processes"
  description = "A formal data retention policy identifies what data needs to be retained, for how long, and where that data resides so it can be securely destroyed or deleted as soon as it is no longer needed."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.cloudwatch_log_group_retention_period_365,
    control.docdb_cluster_backup_retention_period_7_days,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_unused,
    control.ecr_repository_lifecycle_policy_configured,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.2.1"
  })
}

benchmark "pci_dss_v40_requirement_3_3" {
  title = "3.3: Sensitive authentication data (SAD) is not stored after authorization"

  children = [
    benchmark.pci_dss_v40_requirement_3_3_1,
    benchmark.pci_dss_v40_requirement_3_3_2,
    benchmark.pci_dss_v40_requirement_3_3_3
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.3"
  })
}

benchmark "pci_dss_v40_requirement_3_3_1" {
  title       = "3.3.1 SAD is not stored after authorization, even if encrypted. All sensitive authentication data received is rendered unrecoverable upon completion of the authorization process"
  description = "SAD is very valuable to malicious individuals as it allows them to generate counterfeit payment cards and create fraudulent transactions. Therefore, the storage of SAD upon completion of the authorization process is prohibited."

  children = [
    benchmark.pci_dss_v40_requirement_3_3_1_1,
    benchmark.pci_dss_v40_requirement_3_3_1_3
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.3.1"
  })
}

benchmark "pci_dss_v40_requirement_3_3_1_1" {
  title       = "3.3.1.1: The full contents of any track are not stored upon completion of the authorization process"
  description = "If full contents of any track (from the magnetic stripe on the back of a card if present, equivalent data contained on a chip, or elsewhere) is stored, malicious individuals who obtain that data can use it to reproduce payment cards and complete fraudulent transactions."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.cloudwatch_log_group_retention_period_365,
    control.docdb_cluster_backup_retention_period_7_days,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_unused,
    control.ecr_repository_lifecycle_policy_configured,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.3.1.1"
  })
}

benchmark "pci_dss_v40_requirement_3_3_1_3" {
  title       = "3.3.1.3 The personal identification number (PIN) and the PIN block are not stored upon completion of the authorization process"
  description = "PIN and PIN blocks should be known only to the card owner or entity that issued the card. If this data is stolen, malicious individuals can execute fraudulent PIN-based transactions (for example, in-store purchases and ATM withdrawals). Not storing this data reduces the probability of it being compromised."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.cloudwatch_log_group_retention_period_365,
    control.docdb_cluster_backup_retention_period_7_days,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_unused,
    control.ecr_repository_lifecycle_policy_configured,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.3.1.3"
  })
}

benchmark "pci_dss_v40_requirement_3_3_2" {
  title       = "3.3.2: SAD that is stored electronically prior to completion of authorization is encrypted using strong cryptography"
  description = "SAD can be used by malicious individuals to increase the probability of successfully generating counterfeit payment cards and creating fraudulent transactions."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.cloudwatch_log_group_retention_period_365,
    control.docdb_cluster_backup_retention_period_7_days,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_unused,
    control.ecr_repository_lifecycle_policy_configured,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.3.2"
  })
}

benchmark "pci_dss_v40_requirement_3_3_3" {
  title       = "3.3.3: Additional requirement for issuers and companies that support issuing services and store sensitive authentication"
  description = "SAD can be used by malicious individuals to increase the probability of successfully generating counterfeit payment cards and creating fraudulent transactions."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_min_retention_35_days,
    control.cloudwatch_log_group_retention_period_365,
    control.docdb_cluster_backup_retention_period_7_days,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_unused,
    control.ecr_repository_lifecycle_policy_configured,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.3.3"
  })
}

benchmark "pci_dss_v40_requirement_3_5" {
  title = "3.5 Primary account number (PAN) is secured wherever it is stored"

  children = [
    benchmark.pci_dss_v40_requirement_3_5_1
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.5"
  })
}

benchmark "pci_dss_v40_requirement_3_5_1" {
  title       = "3.5.1 PAN is rendered unreadable anywhere it is stored"
  description = "Rendering stored PAN unreadable is a defense in depth control designed to protect the data if an unauthorized individual gains access to stored data by taking advantage of a vulnerability or misconfiguration of an entity's primary access control."

  children = [
    benchmark.pci_dss_v40_requirement_3_5_1_1,
    benchmark.pci_dss_v40_requirement_3_5_1_3
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.5.1"
  })
}

benchmark "pci_dss_v40_requirement_3_5_1_1" {
  title       = "3.5.1.1: Hashes used to render PAN unreadable (per the first bullet of Requirement 3.5.1) are keyed cryptographic hashes of the entire PAN, with associated keymanagement processes and procedures"
  description = "Rendering stored PAN unreadable is a defense in depth control designed to protect the data if an unauthorized individual gains access to stored data by taking advantage of a vulnerability or misconfiguration of an entity's primary access control."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.5.1.1"
  })
}

benchmark "pci_dss_v40_requirement_3_5_1_3" {
  title       = "3.5.1.3: If disk-level or partition-level encryption is used (rather than file-, column-, or field-level database encryption) to render PAN unreadable"
  description = "Disk-level encryption typically encrypts the entire disk or partition using the same key, with all data automatically decrypted when the system runs or when an authorized user requests it."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.backup_recovery_point_manual_deletion_disabled,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.cloudtrail_multi_region_trail_enabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ebs_snapshot_not_publicly_restorable,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.emr_account_public_access_blocked,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion,
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
    control.ssm_document_prohibit_public_access
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.5.1.3"
  })
}

benchmark "pci_dss_v40_requirement_3_6" {
  title = "3.6: Fully Document and Implement Key-Management Processes and Procedures for Cryptographic Keys"

  children = [
    benchmark.pci_dss_v40_requirement_3_6_1,
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.6"
  })
}

benchmark "pci_dss_v40_requirement_3_6_1" {
  title       = "3.6.1: Procedures are defined and implemented to protect cryptographic keys used to protect stored account data against disclosure"
  description = "Cryptographic keys must be strongly protected because those who obtain access will be able to decrypt data."

  children = [
    benchmark.pci_dss_v40_requirement_3_6_1_2,
    benchmark.pci_dss_v40_requirement_3_6_1_3,
    benchmark.pci_dss_v40_requirement_3_6_1_4
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.6.1"
  })
}

benchmark "pci_dss_v40_requirement_3_6_1_2" {
  title       = "3.6.1.2: Secret and private keys used to protect stored account data"
  description = "Storing cryptographic keys securely prevents unauthorized or unnecessary access that could result in the exposure of stored account data. Storing keys separately means they are stored such that if the location of one key is compromised, the second key is not also compromised."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.6.1.2"
  })
}

benchmark "pci_dss_v40_requirement_3_6_1_3" {
  title       = "3.6.1.3: Access to cleartext cryptographic key components is restricted to the fewest number of custodians necessary"
  description = "Restricting the number of people who have access to cleartext cryptographic key components reduces the risk of stored account data being retrieved or rendered visible by unauthorized parties."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.6.1.3"
  })
}

benchmark "pci_dss_v40_requirement_3_6_1_4" {
  title       = "3.6.1.4: Cryptographic keys are stored in the fewest possible locations"
  description = "Storing any cryptographic keys in the fewest locations helps an organization track and monitor all key locations and minimizes the potential for keys to be exposed to unauthorized parties."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.6.1.4"
  })
}

benchmark "pci_dss_v40_requirement_3_7" {
  title = "3.7: Where cryptography is used to protect stored account data, key management processes and procedures covering all aspects of the key lifecycle are defined and implemented"

  children = [
    benchmark.pci_dss_v40_requirement_3_7_1,
    benchmark.pci_dss_v40_requirement_3_7_2,
    benchmark.pci_dss_v40_requirement_3_7_4,
    benchmark.pci_dss_v40_requirement_3_7_5,
    benchmark.pci_dss_v40_requirement_3_7_6,
    benchmark.pci_dss_v40_requirement_3_7_7
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.7"
  })
}

benchmark "pci_dss_v40_requirement_3_7_1" {
  title       = "3.7.1: Key-management policies and procedures are implemented to include generation of strong cryptographic keys used to protect stored account data"
  description = "Use of strong cryptographic keys significantly increases the level of security of encrypted account data."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.7.1"
  })
}

benchmark "pci_dss_v40_requirement_3_7_2" {
  title       = "3.7.2: Key-management policies and procedures are implemented to include secure distribution of cryptographic keys used to protect stored account data"
  description = "Secure distribution or conveyance of secret or private cryptographic keys means that keys are distributed only to authorized custodians."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.7.2"
  })
}

benchmark "pci_dss_v40_requirement_3_7_4" {
  title       = "3.7.4: Key management policies and procedures are implemented for cryptographic key changes for keys that have reached the end of their cryptoperiod, as defined by the associated application vendor or key owner"
  description = "Changing encryption keys when they reach the end of their cryptoperiod is imperative to minimize the risk of someone obtaining the encryption keys and using them to decrypt data."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_cmk_rotation_enabled,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.7.4"
  })
}

benchmark "pci_dss_v40_requirement_3_7_5" {
  title       = "3.7.5: Key management policies procedures are implemented to include the retirement, replacement, or destruction of keys used to protect stored account data"
  description = "Keys that are no longer required, keys with weakened integrity, and keys that are known or suspected to be compromised, should be archived, revoked, and/or destroyed to ensure that the keys can no longer be used."

  children = [
    control.acm_certificate_expires_30_days,
    control.kms_cmk_rotation_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.7.5"
  })
}

benchmark "pci_dss_v40_requirement_3_7_6" {
  title       = "3.7.6 Where manual cleartext cryptographic keymanagement operations are performed by personnel, key-management policies and procedures are implemented, including managing these operations using split knowledge and dual control"
  description = "Split knowledge and dual control of keys are used to eliminate the possibility of a single person having access to the whole key and therefore being able to gain unauthorized access to the data."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.7.6"
  })
}

benchmark "pci_dss_v40_requirement_3_7_7" {
  title       = "3.7.7 Key management policies and procedures are implemented to include the prevention of unauthorized substitution of cryptographic keys"
  description = "If an attacker is able to substitute an entity's key with a key the attacker knows, the attacker will be able to decrypt all data encrypted with that key."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.pci_dss_v40_requirement_3_common_tags, {
    pci_dss_v40_item_id = "3.7.7"
  })
} 
locals {
  pci_dss_v400_requirement_3_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "3"
  })
}

benchmark "pci_dss_v400_requirement_3" {
  title = "Requirement 3: Protect Stored Account Data"

  children = [
    benchmark.pci_dss_v400_requirement_3_2,
    benchmark.pci_dss_v400_requirement_3_3,
    benchmark.pci_dss_v400_requirement_3_5,
    benchmark.pci_dss_v400_requirement_3_6,
    benchmark.pci_dss_v400_requirement_3_7
  ]

  tags = local.pci_dss_v400_requirement_3_common_tags
}

benchmark "pci_dss_v400_requirement_3_2" {
  title = "3.2: Sensitive Authentication Data (SAD) Is Not Stored After Authorization"

  children = [
    benchmark.pci_dss_v400_requirement_3_2_1,
  ]

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.2"
  })
}

benchmark "pci_dss_v400_requirement_3_2_1" {
  title       = "3.2.1: SAD is not stored after authorization, even if it is encrypted."
  description = "SAD is not stored after authorization, even if it is encrypted. Applicability Notes If a PAN is stored, the following SAD elements must be rendered unrecoverable: Full track data (Track 1 and Track 2), CVV or similar service code validation value, PIN/PIN-block. The SAD elements listed in this requirement are typically stored on the magnetic stripe of a card or on a chip, and are also input for online payment processes when a customer presents their card for a purchase."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.2.1"
  })
}

benchmark "pci_dss_v400_requirement_3_3" {
  title = "3.3: Primary Account Number (PAN) Is Secured Wherever It Is Stored"

  children = [
    benchmark.pci_dss_v400_requirement_3_3_1,
    benchmark.pci_dss_v400_requirement_3_3_2,
    benchmark.pci_dss_v400_requirement_3_3_3
  ]

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.3"
  })
}

benchmark "pci_dss_v400_requirement_3_3_1" {
  title       = "3.3.1: PANs are masked when displayed so that only personnel with a legitimate business need can see more than the first six/last four digits of the PAN."
  description = "PANs are masked when displayed so that only personnel with a legitimate business need can see more than the first six/last four digits of the PAN."

  children = [
    benchmark.pci_dss_v400_requirement_3_3_1_1,
    benchmark.pci_dss_v400_requirement_3_3_1_3
  ]

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.3.1"
  })
}

benchmark "pci_dss_v400_requirement_3_3_1_1" {
  title       = "3.3.1.1: A list of roles that need access to more than the first six/last four digits of the PAN (including unmasked displays of PAN in physical media, applications, logs and analytics) is maintained, along with a documented legitimate business need for each role."
  description = "A list of roles that need access to more than the first six/last four digits of the PAN (including unmasked displays of PAN in physical media, applications, logs and analytics) is maintained, along with a documented legitimate business need for each role."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.3.1.1"
  })
}

benchmark "pci_dss_v400_requirement_3_3_1_3" {
  title       = "3.3.1.3: PAN is masked when displayed so that only personnel with a legitimate business need can see more than the first six/last four digits of the PAN."
  description = "PAN is masked when displayed so that only personnel with a legitimate business need can see more than the first six/last four digits of the PAN."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.3.1.3"
  })
}

benchmark "pci_dss_v400_requirement_3_3_2" {
  title       = "3.3.2: The full PAN is only displayed to users whose job requires access to the full PAN."
  description = "The full PAN is only displayed to users whose job requires access to the full PAN."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.3.2"
  })
}

benchmark "pci_dss_v400_requirement_3_3_3" {
  title       = "3.3.3: All displays of PAN conform to PCI DSS requirements."
  description = "All displays of PAN greater than the first six/last four digits require: Assignment of privileges based on job classification and function. Documented approval by management. Presence of a legitimate business need."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.3.3"
  })
}

benchmark "pci_dss_v400_requirement_3_5" {
  title = "3.5: Protect Cryptographic Keys Used to Protect Stored Account Data"

  children = [
    benchmark.pci_dss_v400_requirement_3_5_1
  ]

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.5"
  })
}

benchmark "pci_dss_v400_requirement_3_5_1" {
  title       = "3.5.1: Cryptographic keys used to protect stored account data are secured."
  description = "Access to cryptographic keys is restricted to the fewest number of custodians necessary."

  children = [
    benchmark.pci_dss_v400_requirement_3_5_1_1,
    benchmark.pci_dss_v400_requirement_3_5_1_3
  ]

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.5.1"
  })
}

benchmark "pci_dss_v400_requirement_3_5_1_1" {
  title       = "3.5.1.1: Access to cryptographic keys is restricted to the fewest number of custodians necessary."
  description = "Access to cryptographic keys is restricted to the fewest number of custodians necessary."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.5.1.1"
  })
}

benchmark "pci_dss_v400_requirement_3_5_1_3" {
  title       = "3.5.1.3: Cryptographic keys are stored in the fewest possible locations."
  description = "Cryptographic keys are stored in the fewest possible locations."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.5.1.3"
  })
}

benchmark "pci_dss_v400_requirement_3_6" {
  title = "3.6: Fully Document and Implement Key-Management Processes and Procedures for Cryptographic Keys"

  children = [
    benchmark.pci_dss_v400_requirement_3_6_1,
  ]

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.6"
  })
}

benchmark "pci_dss_v400_requirement_3_6_1" {
  title       = "3.6.1: Fully documented and implemented key-management procedures are in place for cryptographic keys used for encryption of stored account data."
  description = "Key-management procedures include generation of strong cryptographic keys."

  children = [
    benchmark.pci_dss_v400_requirement_3_6_1_2,
    benchmark.pci_dss_v400_requirement_3_6_1_3,
    benchmark.pci_dss_v400_requirement_3_6_1_4
  ]

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.6.1"
  })
}

benchmark "pci_dss_v400_requirement_3_6_1_2" {
  title       = "3.6.1.2: Fully documented and implemented key-management procedures include secure cryptographic key distribution."
  description = "Fully documented and implemented key-management procedures include secure cryptographic key distribution."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.6.1.2"
  })
}

benchmark "pci_dss_v400_requirement_3_6_1_3" {
  title       = "3.6.1.3: Fully documented and implemented key-management procedures include secure cryptographic key storage."
  description = "Fully documented and implemented key-management procedures include secure cryptographic key storage."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.6.1.3"
  })
}

benchmark "pci_dss_v400_requirement_3_6_1_4" {
  title       = "3.6.1.4: Fully documented and implemented key-management procedures include cryptographic key changes for keys that have reached the end of their cryptoperiod."
  description = "Fully documented and implemented key-management procedures include cryptographic key changes for keys that have reached the end of their cryptoperiod."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.6.1.4"
  })
}

benchmark "pci_dss_v400_requirement_3_7" {
  title = "3.7: Manage and Document Cryptographic Key Management Procedures"

  children = [
    benchmark.pci_dss_v400_requirement_3_7_1,
    benchmark.pci_dss_v400_requirement_3_7_2,
    benchmark.pci_dss_v400_requirement_3_7_4,
    benchmark.pci_dss_v400_requirement_3_7_5,
    benchmark.pci_dss_v400_requirement_3_7_6,
    benchmark.pci_dss_v400_requirement_3_7_7
  ]

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.7"
  })
}

benchmark "pci_dss_v400_requirement_3_7_1" {
  title       = "3.7.1: Security policies and operational procedures for protecting stored account data are documented."
  description = "Security policies and operational procedures for protecting stored account data are documented, in use, and known to all affected parties."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.7.1"
  })
}

benchmark "pci_dss_v400_requirement_3_7_2" {
  title       = "3.7.2: Security policies and operational procedures for protecting stored account data are documented."
  description = "Security policies and operational procedures for protecting stored account data include masking of PAN when displayed."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.7.2"
  })
}

benchmark "pci_dss_v400_requirement_3_7_4" {
  title       = "3.7.4: Security policies and operational procedures for protecting stored account data are documented."
  description = "Security policies and operational procedures for protecting stored account data include key-management processes and procedures for cryptographic keys used for encryption of cardholder data."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.7.4"
  })
}

benchmark "pci_dss_v400_requirement_3_7_5" {
  title       = "3.7.5: Security policies and operational procedures for protecting stored account data are documented."
  description = "Security policies and operational procedures for protecting stored account data include procedures to address failures of any critical security control systems."

  children = [
    control.acm_certificate_expires_30_days,
    control.kms_cmk_rotation_enabled
  ]

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.7.5"
  })
}

benchmark "pci_dss_v400_requirement_3_7_6" {
  title       = "3.7.6: Security policies and operational procedures for protecting stored account data are documented."
  description = "Security policies and operational procedures for protecting stored account data include periodic procedures to identify and securely delete stored cardholder data that exceeds defined retention requirements."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.7.6"
  })
}

benchmark "pci_dss_v400_requirement_3_7_7" {
  title       = "3.7.7: Security policies and operational procedures for protecting stored account data are documented."
  description = "Security policies and operational procedures for protecting stored account data include: A data-discovery methodology to confirm PAN is not stored in unintended locations, A response plan for locating and securing PAN if discovered in an unintended location."

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

  tags = merge(local.pci_dss_v400_requirement_3_common_tags, {
    pci_dss_v400_item_id = "3.7.7"
  })
} 
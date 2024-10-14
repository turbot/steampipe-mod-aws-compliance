benchmark "nist_800_53_rev_5_ac" {
  title       = "Access Control (AC)"
  description = "The access control family consists of security requirements detailing system logging. This includes who has access to what assets and reporting capabilities like account management, system privileges, and remote access logging to determine when users have access to the system and their level of access."
  children = [
    benchmark.nist_800_53_rev_5_ac_2,
    benchmark.nist_800_53_rev_5_ac_3,
    benchmark.nist_800_53_rev_5_ac_4,
    benchmark.nist_800_53_rev_5_ac_5,
    benchmark.nist_800_53_rev_5_ac_6,
    benchmark.nist_800_53_rev_5_ac_7,
    benchmark.nist_800_53_rev_5_ac_16,
    benchmark.nist_800_53_rev_5_ac_17,
    benchmark.nist_800_53_rev_5_ac_24
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2" {
  title       = "Account Management (AC-2)"
  description = "Manage system accounts, group memberships, privileges, workflow, notifications, deactivations, and authorizations."
  children = [
    benchmark.nist_800_53_rev_5_ac_2_1,
    benchmark.nist_800_53_rev_5_ac_2_3,
    benchmark.nist_800_53_rev_5_ac_2_4,
    benchmark.nist_800_53_rev_5_ac_2_6,
    benchmark.nist_800_53_rev_5_ac_2_12,
    benchmark.nist_800_53_rev_5_ac_2_d_1,
    benchmark.nist_800_53_rev_5_ac_2_g,
    benchmark.nist_800_53_rev_5_ac_2_i_2,
    benchmark.nist_800_53_rev_5_ac_2_j
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_1" {
  title       = "AC-2(1) Automated System Account Management"
  description = "Support the management of system accounts using [Assignment: organization-defined automated mechanisms]."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_3" {
  title       =  "AC-2(3) Disable Accounts"
  description = "Disable accounts within [Assignment: organization-defined time period] when the accounts: (a) Have expired; (b) Are no longer associated with a user or individual; (c) Are in violation of organizational policy; or (d) Have been inactive for [Assignment: organization-defined time period]."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_user_unused_credentials_90,
    benchmark.nist_800_53_rev_5_ac_2_3_a,
    benchmark.nist_800_53_rev_5_ac_2_3_b,
    benchmark.nist_800_53_rev_5_ac_2_3_c,
    benchmark.nist_800_53_rev_5_ac_2_3_d
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_3_a" {
  title       = "AC-2(3)(a)"
  description = "Disable accounts within [Assignment: organization-defined time period] when the accounts: (a) Have expired."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_2_3_b" {
  title       = "AC-2(3)(b)"
  description = "Disable accounts within [Assignment: organization-defined time period] when the accounts: (b) Are no longer associated with a user or individual."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_2_3_c" {
  title       = "AC-2(3)(c)"
  description = "Disable accounts within [Assignment: organization-defined time period] when the accounts: (c) Are in violation of organizational policy."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_user_unused_credentials_90
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_3_d" {
  title       = "AC-2(3)(d)"
  description = "Disable accounts within [Assignment: organization-defined time period] when the accounts: (d) Have been inactive for [Assignment: organization-defined time period]."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_2_4" {
  title       = "AC-2(4) Automated Audit Actions"
  description = "Automatically audit account creation, modification, enabling, disabling, and removal actions."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_6" {
  title       = "AC-2(6) Dynamic Privilege Management"
  description = "Implement [Assignment: organization-defined dynamic privilege management capabilities]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_uses_imdsv2,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_12" {
  title       = "AC-2(12) Account Monitoring"
  description = "Monitors and reports atypical usage of information system accounts to organization-defined personnel or roles."
  children = [
    benchmark.nist_800_53_rev_5_ac_2_12_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_2_12_a" {
  title       = "AC-2(12)(a)"
  description = "Monitor system accounts for [Assignment: organization-defined atypical usage]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ac_2_d_1" {
  title       = "AC-2(d)(1)"
  description = "d. Specify: 1. Authorized users of the system;personnel termination and transfer processes."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_2_g" {
  title       = "AC-2(g)"
  description = "The organization: g. Monitors the use of information system accounts."
  children = [
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_2_i_2" {
  title       = "AC-2(i)(2)"
  description = "i. Authorize access to the system based on: 2. Intended system usage."
  children = [
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_2_j" {
  title       = "AC-2(j)"
  description = "The organization: j. Reviews accounts for compliance with account management requirements [Assignment: organization-defined frequency]."
  children = [
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_3" {
  title       = "Access Enforcement (AC-3)"
  description = "Enforce approved authorizations for logical access to information and system resources in accordance with applicable access control policies."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_1,
    benchmark.nist_800_53_rev_5_ac_3_2,
    benchmark.nist_800_53_rev_5_ac_3_3,
    benchmark.nist_800_53_rev_5_ac_3_4,
    benchmark.nist_800_53_rev_5_ac_3_7,
    benchmark.nist_800_53_rev_5_ac_3_8,
    benchmark.nist_800_53_rev_5_ac_3_10,
    benchmark.nist_800_53_rev_5_ac_3_12,
    benchmark.nist_800_53_rev_5_ac_3_13,
    benchmark.nist_800_53_rev_5_ac_3_15,
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_uses_imdsv2,
    control.ecs_task_definition_user_for_host_mode_check,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_1" {
  title       = "AC-3(1) Restricted Access To Privileged Functions"
  description = "Employ an audited override of automated access control mechanisms under [Assignment: organization-defined conditions] by [Assignment: organization-defined roles]."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_2" {
  title       = "AC-3(2) Dual Authorization"
  description = "Enforce dual authorization for [Assignment: organization-defined privileged commands and/or other organization-defined actions]."
  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_3_3" {
  title       = "AC-3(3) Mandatory Access Control"
  description = "Enforce [Assignment: organization-defined mandatory access control policy] over the set of covered subjects and objects specified in the policy, and where the policy: (a) Is uniformly enforced across the covered subjects and objects within the system; (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (1) Passing the information to unauthorized subjects or objects; (2) Granting its privileges to other subjects; (3) Changing one or more security attributes (specified by the policy) on subjects, objects, the system, or system components; (4) Choosing the security attributes and attribute values (specified by the policy) to be associated with newly created or modified objects; and (5) Changing the rules governing access control; and (c) Specifies that [Assignment: organization-defined subjects] may explicitly be granted [Assignment: organization-defined privileges] such that they are not limited by any defined subset (or all) of the above constraints."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_3_a,
    benchmark.nist_800_53_rev_5_ac_3_3_b_1,
    benchmark.nist_800_53_rev_5_ac_3_3_b_2,
    benchmark.nist_800_53_rev_5_ac_3_3_b_3,
    benchmark.nist_800_53_rev_5_ac_3_3_b_4,
    benchmark.nist_800_53_rev_5_ac_3_3_b_5,
    benchmark.nist_800_53_rev_5_ac_3_3_c,
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_a" {
  title       = "AC-3(3)(a)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (a) Is uniformly enforced across the covered subjects and objects within the system."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_1" {
  title       = "AC-3(3)(b)(1)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (1) Passing the information to unauthorized subjects or objects."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_2" {
  title       = "AC-3(3)(b)(2)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (2) Granting its privileges to other subjects."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_3" {
  title       = "AC-3(3)(b)(3)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (3) Changing one or more security attributes (specified by the policy) on subjects, objects, the system, or system components."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day,
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_4" {
  title       = "AC-3(3)(b)(4)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (4) Choosing the security attributes and attribute values (specified by the policy) to be associated with newly created or modified objects."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_b_5" {
  title       = "AC-3(3)(b)(5)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (b) Specifies that a subject that has been granted access to information is constrained from doing any of the following; (5) Changing the rules governing access."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_3_c" {
  title       = "AC-3(3)(c)"
  description = "Enforce [Assignment: organization-defined mandatory access policy] over the set of covered subjects and objects specified in the policy, and where the policy: (c) Specifies that [Assignment: organization-defined subjects] may explicitly be granted [Assignment: organization-defined privileges] such that they are not limited by any defined subset (or all) of the above constraints."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4" {
  title       = "AC-3(4) Discretionary Access Control"
  description = "Enforce [Assignment: organization-defined discretionary access control policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (a) Pass the information to any other subjects or objects; (b) Grant its privileges to other subjects; (c) Change security attributes on subjects, objects, the system, or the system’s components; (d) Choose the security attributes to be associated with newly created or revised objects; or (e) Change the rules governing access control."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_4_a,
    benchmark.nist_800_53_rev_5_ac_3_4_b,
    benchmark.nist_800_53_rev_5_ac_3_4_c,
    benchmark.nist_800_53_rev_5_ac_3_4_d,
    benchmark.nist_800_53_rev_5_ac_3_4_e,
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_a" {
  title       = "AC-3(4)(a)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (a) Pass the information to any other subjects or objects."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_b" {
  title       = "AC-3(4)(b)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (b) Grant its privileges to other subjects."
  children = [
    control.secretsmanager_secret_unused_90_day,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.iam_user_unused_credentials_90,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_access_key_age_90,
    control.iam_root_user_no_access_keys,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_policy_no_star_star,
    control.iam_group_user_role_no_inline_policies,
    control.iam_account_password_policy_min_length_14,
    control.ec2_instance_uses_imdsv2
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_c" {
  title       = "AC-3(4)(c)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (c) Change security attributes on subjects, objects, the system, or the system’s components."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_d" {
  title       = "AC-3(4)(d)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (d) Choose the security attributes to be associated with newly created or revised objects."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_4_e" {
  title       = "AC-3(4)(e)"
  description = "Enforce [Assignment: organization-defined discretionary access policy] over the set of covered subjects and objects specified in the policy, and where the policy specifies that a subject that has been granted access to information can do one or more of the following: (e) Change the rules governing access."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_7" {
  title       = "AC-3(7) Role-Based Access Control"
  description = "Enforce a role-based access control policy over defined subjects and objects and control access based upon [Assignment: organization-defined roles and users authorized to assume such roles]."
  children = [
     control.s3_bucket_restrict_public_read_access,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_uses_imdsv2,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_8" {
  title       = "AC-3(8) Revocation Of Access Authorizations"
  description = "Enforce the revocation of access authorizations resulting from changes to the security attributes of subjects and objects based on [Assignment: organization-defined rules governing the timing of revocations of access authorizations]."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_10" {
  title       = "AC-3(10) Audited Override Of Access Control Mechanisms"
  description = "Employ an audited override of automated access mechanisms under [Assignment: organization-defined conditions] by [Assignment: organization-defined roles]."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_12" {
  title       = "AC-3(12)  Assert And Enforce Application Access"
  description = "a. Require applications to assert, as part of the installation process, the access needed to the following system applications and functions: [Assignment: organization-defined system applications and functions];b. Provide an enforcement mechanism to prevent unauthorized access; and c. Approve access changes after initial installation of the application."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_12_a,
    benchmark.nist_800_53_rev_5_ac_3_12_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_12_a" {
  title       = "AC-3(12)(a)"
  description = "Require applications to assert, as part of the installation process, the access needed to the following system applications and functions: [Assignment: organization-defined system applications and functions]."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_12_b" {
  title       = "AC-3(12)(b)"
  description = "Provide an enforcement mechanism to prevent unauthorized access;"
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ac_3_13" {
  title       = "AC-3(13) Attribute-Based Access Control"
  description = "Enforce attribute-based access control policy over defined subjects and objects and control access based upon [Assignment: organization-defined attributes to assume access permissions]."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_15" {
  title       = "AC-3(15) Discretionary And Mandatory Access Control"
  description = "a. Enforce [Assignment: organization-defined mandatory access control policy] over the set of covered subjects and objects specified in the policy; and b. Enforce [Assignment: organization-defined discretionary access control policy] over the set of covered subjects and objects specified in the policy."
  children = [
    benchmark.nist_800_53_rev_5_ac_3_15_a,
    benchmark.nist_800_53_rev_5_ac_3_15_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_15_a" {
  title       = "AC-3(15)(a)"
  description = "Enforce [Assignment: organization-defined mandatory access control policy] over the set of covered subjects and objects specified in the policy."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_3_15_b" {
  title       = "AC-3(15)(b)"
  description = "Enforce [Assignment: organization-defined discretionary access control policy] over the set of covered subjects and objects specified in the policy."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_4" {
  title       = "Information Flow Enforcement (AC-4)"
  description = "Enforce approved authorizations for controlling the flow of information within the system and between connected systems based on [Assignment: organization-defined information flow control policies]."
  children = [
    benchmark.nist_800_53_rev_5_ac_4_21,
    benchmark.nist_800_53_rev_5_ac_4_22,
    benchmark.nist_800_53_rev_5_ac_4_26,
    benchmark.nist_800_53_rev_5_ac_4_28,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_4_21" {
  title       = "AC-4(21) Physical Or Logical Separation Of Infomation Flows"
  description = "Separate information flows logically or physically using [Assignment: organization-defined mechanisms and/or techniques] to accomplish [Assignment: organization-defined required separations by types of information]."
  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.elb_application_lb_waf_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_4_22" {
  title       = "AC-4(22) Access Only"
  description = "Provide access from a single device to computing platforms, applications, or data residing in multiple different security domains, while preventing information flow between the different security domains."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_4_26" {
  title       = "AC-4(26) Audit Filtering Actions"
  description = "When transferring information between different security domains, record and audit content filtering actions and results for the information being filtered."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_4_28" {
  title       = "AC-4(28) Linear Filter Pipelines"
  description = "When transferring information between different security domains, implement a linear content filter pipeline that is enforced with discretionary and mandatory access controls."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_5" {
  title       = "Separation Of Duties (AC-5)"
  description = "Separate duties of individuals to prevent malevolent activity. automate separation of duties and access authorizations."
  children = [
    benchmark.nist_800_53_rev_5_ac_5_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_5_b" {
  title       = "AC-5(b)"
  description = "Define system access authorizations to support separation of duties."
  children = [
    control.ecs_task_definition_user_for_host_mode_check,
    control.iam_all_policy_no_service_wild_card,
    control.iam_policy_no_star_star
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_6" {
  title       = "Least Privilege (AC-6)"
  description = "Employ the principle of least privilege, allowing only authorized accesses for users (or processes acting on behalf of users) that are necessary to accomplish assigned organizational tasks."
  children = [
    benchmark.nist_800_53_rev_5_ac_6_2,
    benchmark.nist_800_53_rev_5_ac_6_3,
    benchmark.nist_800_53_rev_5_ac_6_9,
    benchmark.nist_800_53_rev_5_ac_6_10,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_uses_imdsv2,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_6_2" {
  title       = "AC-6(2)"
  description = "Require that users of system accounts (or roles) with access to [Assignment: organization-defined security functions or security-relevant information] use non-privileged accounts or roles, when accessing nonsecurity functions."
  children = [
    control.iam_all_policy_no_service_wild_card,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service  = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_6_3" {
  title       = "AC-6(3)"
  description = "Authorize network access to [Assignment: organization-defined privileged commands] only for [Assignment: organization-defined compelling operational needs] and document the rationale for such access in the security plan for the system."
  children = [
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_6_9" {
  title       = "AC-6(9)"
  description = "Log the execution of privileged functions."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_6_10" {
  title       = "AC-6(10)"
  description = "Prevent non-privileged users from executing privileged functions."
  children = [
    control.iam_all_policy_no_service_wild_card,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_7" {
  title       = "Unsuccessful Logon Attempts (AC-7)"
  description = "a. Enforce a limit of [Assignment: organization-defined number] consecutive invalid logon attempts by a user during a [Assignment:organization-defined time period]; and b. Automatically [Selection (one or more): lock the account or node for an [Assignment: organization-defined time period]; lock the account or node until released by an administrator; delay next logon prompt per [Assignment: organization-defined delay algorithm]; notify system administrator; take other[Assignment: organization-defined action]] when the maximum number of unsuccessful attempts is exceeded."
  children = [
    benchmark.nist_800_53_rev_5_ac_7_4
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_7_4" {
  title       = "AC-7(4) Use Of Alternate Authentication Factor"
  description = "a. Allow the use of [Assignment: organization-defined authentication factors] that are different from the primary authentication factors after the number of organization-defined consecutive invalid logon attempts have been exceeded; and b. Enforce a limit of [Assignment: organization-defined number] consecutive invalid logon attempts through use of the alternative factors by a user during a [Assignment: organization-defined time period]."
  children = [
    benchmark.nist_800_53_rev_5_ac_7_4_a,
    control.iam_account_password_policy_min_length_14,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_7_4_a" {
  title       = "AC-7(4)(a)"
  description = "Allow the use of [Assignment: organization-defined authentication factors] that are different from the primary authentication factors after the number of organization-defined consecutive invalid logon attempts have been exceeded."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ac_16" {
  title       = "Security And Privacy Attributes (AC-16)"
  description = "a. Provide the means to associate [Assignment: organization-defined types of security and privacy attributes] with [Assignment: organization-defined security and privacy attribute values] for information in storage, in process, and/or in transmission; b. Ensure that the attribute associations are made and retained with the information; c. Establish the following permitted security and privacy attributes from the attributes defined in AC-16a for [Assignment: organization-defined systems]: [Assignment: organization-defined security and privacy attributes]."
  children = [
    benchmark.nist_800_53_rev_5_ac_16_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_16_b" {
  title       = "AC-16(b)"
  description = "Ensure that the attribute associations are made and retained with the information."
  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudWatch"
  })
}

benchmark "nist_800_53_rev_5_ac_17" {
  title       = "Remote Access (AC-17)"
  description = "Authorize remote access systems prior to connection. Enforce remote connection requirements to information systems."
  children = [
    benchmark.nist_800_53_rev_5_ac_17_1,
    benchmark.nist_800_53_rev_5_ac_17_2,
    benchmark.nist_800_53_rev_5_ac_17_4,
    benchmark.nist_800_53_rev_5_ac_17_9,
    benchmark.nist_800_53_rev_5_ac_17_10,
    benchmark.nist_800_53_rev_5_ac_17_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_17_b" {
  title       = "AC-17(b)"
  description = "Authorize each type of remote access to the system prior to allowing such connections."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_17_1" {
  title       = "AC-17(1) Monitoring And Control"
  description = "Employ automated mechanisms to monitor and control remote access methods."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_17_2" {
  title       = "AC-17(2) Protection Of Confidentiality And Integrity Using Encryption"
  description = "Implement cryptographic mechanisms to protect the confidentiality and integrity of remote access sessions."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_17_4" {
  title       = "AC-17(4) Privileged Commands And Access"
  description = "a. Authorize the execution of privileged commands and access to security-relevant information via remote access only in a format that provides assessable evidence and for the following needs: [Assignment: organization-defined needs]; and b. Document the rationale for remote access in the security plan for the system."
  children = [
    benchmark.nist_800_53_rev_5_ac_17_4_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_17_4_a" {
  title       = "AC-17(4)(a)"
  description = "Authorize the execution of privileged commands and access to security-relevant information via remote access only in a format that provides assessable evidence and for the following needs: [Assignment: organization-defined needs];"
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled,
   control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_17_9" {
  title       = "AC-17(9) Disconnect Or Disable Access"
  description = "Provide the capability to disconnect or disable remote access to the system within [Assignment: organization-defined time period]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_17_10" {
  title       = "AC-17(10) Authenticate Remote Commands"
  description = "Provide the capability to disconnect or disable remote access to the system within [Assignment: organization-defined time period]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_24" {
  title       = "Access Control Decisions (AC-24)"
  description = "[Selection: Establish procedures; Implement mechanisms] to ensure [Assignment: organization-defined access control decisions] are applied to each access request prior to access enforcement."
  children = [
    benchmark.nist_800_53_rev_5_ac_24_1,
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ac_24_1" {
  title       = "AC-24(1)"
  description = "Transmit [Assignment: organization-defined access authorization information] using [Assignment: organization-defined controls] to [Assignment: organization-defined systems] that enforce access control decisions."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}
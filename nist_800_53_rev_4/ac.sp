benchmark "nist_800_53_rev_4_ac" {
  title       = "Access Control (AC)"
  description = "The access control family consists of security requirements detailing system logging. This includes who has access to what assets and reporting capabilities like account management, system privileges, and remote access logging to determine when users have access to the system and their level of access."
  children = [
    benchmark.nist_800_53_rev_4_ac_2,
    benchmark.nist_800_53_rev_4_ac_3,
    benchmark.nist_800_53_rev_4_ac_4
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_2" {
  title       = "AC-2 Account Management"
  description = "Manage system accounts, group memberships, privileges, workflow, notifications, deactivations, and authorizations."
  children = [
    benchmark.nist_800_53_rev_4_ac_2_1,
    benchmark.nist_800_53_rev_4_ac_2_3,
    benchmark.nist_800_53_rev_4_ac_2_4,
    benchmark.nist_800_53_rev_4_ac_2_12,
    benchmark.nist_800_53_rev_4_ac_2_f,
    benchmark.nist_800_53_rev_4_ac_2_g,
    benchmark.nist_800_53_rev_4_ac_2_j
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_2_1" {
  title       = "AC-2(1) Automated System Account Management"
  description = "The organization employs automated mechanisms to support the management of information system accounts."
  children = [
    control.guardduty_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_user_access_key_age_90,
    control.iam_user_in_group,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_2_3" {
  title       = "AC-2(3) Disable Inactive Accounts"
  description = "The information system automatically disables inactive accounts after 90 days for user accounts."
  children = [
    control.iam_user_unused_credentials_90
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_2_4" {
  title       = "AC-2(4) Automated Audit Actions"
  description = "The information system automatically audits account creation, modification, enabling, disabling, and removal actions, and notifies [Assignment: organization-defined personnel or roles]."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_2_12" {
  title       = "AC-2(12) Account Monitoring"
  description = "Monitors and reports atypical usage of information system accounts to organization-defined personnel or roles."
  children = [
    benchmark.nist_800_53_rev_4_ac_2_12_a
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_2_12_a" {
  title       = "AC-2(12)(a)"
  description = "Monitors information system accounts for organization-defined atypical usage."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_2_f" {
  title       = "AC-2(f)"
  description = "Creates, enables, modifies, disables, and removes information system accounts in accordance with organization-defined procedures or conditions."
  children = [
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_2_g" {
  title       = "AC-2(g)"
  description = "Monitors the use of information system accounts."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_root_user_no_access_keys,
    control.iam_user_unused_credentials_90,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_2_j" {
  title       = "AC-2(j)"
  description = "Reviews accounts for compliance with account management requirements."
  children = [
    control.emr_cluster_kerberos_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.secretsmanager_secret_rotated_as_scheduled
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_3" {
  title       = "AC-3 Access Enforcement"
  description = "Enforce approved authorizations for access to systems in accordance with policy."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.emr_cluster_kerberos_enabled,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_restrict_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_bucket_account
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_ac_4" {
  title       = "AC-4 Information Flow Enforcement"
  description = "Enforce approved authorizations. Control information workflow between interconnected systems."
  children = [
    control.acm_certificate_expires_30_days,
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
    control.s3_public_access_block_bucket_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.nist_800_53_rev_4_common_tags
}
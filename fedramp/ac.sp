benchmark "fedramp_ac" {
  title       = "Access Control (AC)"
  description = "to do"
  children = [
    benchmark.fedramp_ac_2,
    benchmark.fedramp_ac_3
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_ac_2" {
  title       = "Account Management (AC-2)"
  description = ""
  children = [
    control.apigateway_stage_logging_enabled,
    control.ecs_task_definition_user_for_host_mode_check,
    control.es_domain_logs_to_cloudwatch,
    control.iam_group_user_role_no_inline_policies,
    control.iam_all_policy_no_service_wild_card,
    control.cloudtrail_multi_region_trail_enabled,
    control.rds_db_instance_logging_enabled,
    control.securityhub_enabled,
    control.wafv2_web_acl_logging_enabled,
    control.iam_user_access_key_age_90,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.iam_group_not_empty,
    control.iam_account_password_policy_min_length_14,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.iam_user_console_access_mfa_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.s3_bucket_logging_enabled,
    benchmark.fedramp_ac_2_1,
    benchmark.fedramp_ac_2_4,
    benchmark.fedramp_ac_2_12,
    benchmark.fedramp_ac_2_f,
    benchmark.fedramp_ac_2_g,
    benchmark.fedramp_ac_2_j
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "low"
  })
}

benchmark "fedramp_ac_2_f" {
  title       = "AC-2(f)"
  description = "The organization: f. Creates, enables, modifies, disables, and removes information system accounts in accordance with [Assignment: organization-defined procedures or conditions]."
  children = [
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_all_policy_no_service_wild_card,
    control.iam_user_access_key_age_90,
    control.iam_account_password_policy_min_length_14,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_root_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_ac_2_g" {
  title       = "AC-2(g)"
  description = "The organization: g. Monitors the use of information system accounts."
  children = [
    control.apigateway_stage_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.cloudtrail_multi_region_trail_enabled,
    control.rds_db_instance_logging_enabled,
    control.securityhub_enabled,
    control.wafv2_web_acl_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.guardduty_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled

  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_ac_2_j" {
  title       = "AC-2(j)"
  description = "The organization: j. Reviews accounts for compliance with account management requirements [Assignment: organization-defined frequency]."
  children = [
    control.ecs_task_definition_user_for_host_mode_check,
    control.iam_group_user_role_no_inline_policies,
    control.iam_all_policy_no_service_wild_card,
    control.iam_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_access_key_age_90,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_root_user_mfa_enabled
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_ac_2_1" {
  title       = "Automated System Account Management AC-2(1)"
  description = "The organization employs automated mechanisms to support the management of information system accounts."
  children = [
    control.iam_group_user_role_no_inline_policies,
    control.securityhub_enabled,
    control.iam_user_access_key_age_90,
    control.guardduty_enabled,
    control.iam_account_password_policy_min_length_14,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_ac_2_3" {
  title       = "Disable Inactive Accounts AC-2(3)"
  description = "The information system automatically disables inactive accounts after 90 days for user accounts."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_user_unused_credentials_90,
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_ac_2_4" {
  title       = "Automated Audit Actions AC-2(4)"
  description = "The information system automatically audits account creation, modification, enabling, disabling, and removal actions, and notifies [Assignment: organization-defined personnel or roles]."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.rds_db_instance_logging_enabled,
    control.securityhub_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_ac_2_12" {
  title       = "Account Monitoring/Atypical Usage AC-2(12)"
  description = ""
  children = [
    benchmark.fedramp_ac_2_12_a
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_ac_2_12_a" {
  title       = "AC-2(12)(a)"
  description = "The organization: a. Monitors information system accounts for [Assignment: organization-defined atypical use]."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}


benchmark "fedramp_ac_3" {
  title       = "Access Enforcement AC-3"
  description = "The information system enforces approved authorizations for logical access to information and system resources in accordance with applicable access control policies."
  children = [
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_all_policy_no_service_wild_card,
    control.iam_user_access_key_age_90,
    control.iam_account_password_policy_min_length_14,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_root_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

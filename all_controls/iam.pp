locals {
  all_controls_iam_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "all_controls_iam" {
  title       = "IAM"
  description = "This section contains recommendations for configuring IAM resources."
  children = [
    control.iam_access_analyzer_enabled_without_findings,
    control.iam_access_analyzer_enabled,
    control.iam_account_password_policy_min_length_14,
    control.iam_account_password_policy_one_lowercase_letter,
    control.iam_account_password_policy_one_number,
    control.iam_account_password_policy_one_symbol,
    control.iam_account_password_policy_one_uppercase_letter,
    control.iam_account_password_policy_reuse_24,
    control.iam_account_password_policy_strong_min_length_8,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_custom_policy_unattached_no_star_star,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_inline_policy_no_administrative_privileges,
    control.iam_managed_policy_attached_to_role,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_password_policy_expire_90,
    control.iam_policy_all_attached_no_star_star,
    control.iam_policy_custom_attached_no_star_star,
    control.iam_policy_custom_no_assume_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_custom_no_permissive_role_assumption,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_full_access_to_cloudtrail,
    control.iam_policy_no_full_access_to_kms,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
    control.iam_custom_policy_unused,
    control.iam_role_cross_account_read_only_access_policy,
    control.iam_role_cross_account_write_access_policy,
    control.iam_role_no_administrator_access_policy_attached,
    control.iam_role_unused_60,
    control.iam_root_last_used,
    control.iam_root_user_account_console_access_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_security_audit_role,
    control.iam_server_certificate_not_expired,
    control.iam_support_role,
    control.iam_user_access_key_age_365,
    control.iam_user_access_key_age_90,
    control.iam_user_access_key_unused_45,
    control.iam_user_access_keys_and_password_at_setup,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_console_access_unused_45,
    control.iam_user_group_role_cloudshell_fullaccess_restricted,
    control.iam_user_hardware_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_no_policies,
    control.iam_user_one_active_key,
    control.iam_user_unused_credentials_45,
    control.iam_user_unused_credentials_90,
    control.iam_user_with_administrator_access_mfa_enabled
  ]

  tags = merge(local.all_controls_iam_common_tags, {
    type = "Benchmark"
  })
}

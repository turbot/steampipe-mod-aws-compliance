benchmark "article_25_data_protection_by_design_and_by_default" {
  title       = "Article 25 Data protection by design and by default"
  description = "Article 25 of the GDPR states that the controller '…shall implement appropriate technical and organizational measures for ensuring that, by default, only personal data which are necessary for each specific purpose of the processing are processed.' The following AWS access control mechanisms can help customers comply with this requirement by allowing only authorized administrators, users, and applications to get access to AWS resources and customer data."
  documentation = file("./gdpr/docs/article_25_data_protection_by_design_and_by_default.md")
  children = [
    control.cloudtrail_bucket_not_public,
    control.cloudtrail_enabled_all_regions,
    control.cloudtrail_s3_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.config_enabled_all_regions,
    control.iam_account_password_policy_min_length_14,
    control.iam_account_password_policy_one_lowercase_letter,
    control.iam_account_password_policy_one_number,
    control.iam_account_password_policy_one_symbol,
    control.iam_account_password_policy_one_uppercase_letter,
    control.iam_account_password_policy_reuse_24,
    control.iam_account_password_policy_strong,
    control.iam_password_policy_expire_90,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_support_role,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.kms_cmk_rotation_enabled,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_root_login,
    control.log_metric_filter_unauthorized_api,
    control.vpc_flow_logs_enabled
  ]

  tags = local.gdpr_common_tags
}

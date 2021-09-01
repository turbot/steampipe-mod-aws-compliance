benchmark "article_25_data_protection_by_design_and_by_default" {
  title       = "Article 25 Data protection by design and by default"
  description = "The controller shall implement appropriate technical and organizational measures for ensuring that, by default, only personal data which are necessary for each specific purpose of the processing are processed."
  children = [
    benchmark.article_25_data_protection_by_design_and_by_default_1,
  ]

  tags = local.gdpr_common_tags
}

benchmark "article_25_data_protection_by_design_and_by_default_1" {
  title       = "Article 25 Data protection by design and by default 1"
  description = "Taking into account the state of the art, the cost of implementation and the nature, scope, context and purposes of processing as well as the risks of varying likelihood and severity for rights and freedoms of natural persons posed by the processing, the controller shall, both at the time of the determination of the means for processing and at the time of the processing itself, implement appropriate technical and organisational measures, such as pseudonymisation, which are designed to implement data-protection principles, such as data minimisation, in an effective manner and to integrate the necessary safeguards into the processing in order to meet the requirements of this Regulation and protect the rights of data subjects."
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
    control.vpc_flow_logs_enabled,
  ]

  tags = local.gdpr_common_tags
}

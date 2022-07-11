benchmark "nist_sp_800_171_rev_2_3_5" {
  title       = "3.5 Identification and Authentication"
  description = "IA controls are specific to the identification and authentication policies in an organization. This includes the identification and authentication of organizational and non-organizational users and how the management of those systems."
  children = [
    benchmark.nist_sp_800_171_rev_2_3_5_2,
    benchmark.nist_sp_800_171_rev_2_3_5_3,
    benchmark.nist_sp_800_171_rev_2_3_5_5,
    benchmark.nist_sp_800_171_rev_2_3_5_6,
    benchmark.nist_sp_800_171_rev_2_3_5_7,
    benchmark.nist_sp_800_171_rev_2_3_5_8,
    benchmark.nist_sp_800_171_rev_2_3_5_10

  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_5_2" {
  title       = "3.5.2"
  description = "Authenticate (or verify) the identities of users, processes, or devices, as a prerequisite to allowing access to organizational systems."
  children = [
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_5_3" {
  title       = "3.5.3"
  description = "Use multifactor authentication for local and network access to privileged accounts and for network access to non-privileged accounts."
  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_5_5" {
  title       = "3.5.5"
  description = "Prevent reuse of identifiers for a defined period."
  children = [
    control.iam_account_password_policy_reuse_24,
    control.iam_password_policy_expire_90
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_5_6" {
  title       = "3.5.6"
  description = "Disable identifiers after a defined period of inactivity."
  children = [
    control.iam_account_password_policy_reuse_24,
    control.iam_password_policy_expire_90,
    control.iam_user_unused_credentials_90
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_5_7" {
  title       = "3.5.7"
  description = "7 Enforce a minimum password complexity and change of characters when new passwords are created."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_account_password_policy_one_lowercase_letter,
    control.iam_account_password_policy_one_number,
    control.iam_account_password_policy_one_symbol,
    control.iam_account_password_policy_one_uppercase_letter,
    control.iam_account_password_policy_reuse_24,
    control.iam_password_policy_expire_90,
    control.iam_user_unused_credentials_90
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_5_8" {
  title       = "3.5.8"
  description = "Prohibit password reuse for a specified number of generations."
  children = [
    control.iam_account_password_policy_reuse_24,
    control.iam_password_policy_expire_90,
    control.iam_user_unused_credentials_90
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_5_10" {
  title       = "3.5.10"
  description = "Store and transmit only cryptographically-protected passwords."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.ebs_attached_volume_encryption_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_5" {
  title       = "3.5 Identification and Authentication"
  description = "IA controls are specific to the identification and authentication policies in an organization. This includes the identification and authentication of organizational and non-organizational users and how the management of those systems."
  children = [
    benchmark.nist_800_171_rev_2_3_5_2,
    benchmark.nist_800_171_rev_2_3_5_3,
    benchmark.nist_800_171_rev_2_3_5_5,
    benchmark.nist_800_171_rev_2_3_5_6,
    benchmark.nist_800_171_rev_2_3_5_7,
    benchmark.nist_800_171_rev_2_3_5_8,
    benchmark.nist_800_171_rev_2_3_5_10
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_5_2" {
  title       = "3.5.2 Authenticate (or verify) the identities of users, processes, or devices, as a prerequisite to allowing access to organizational systems"
  description = "Individual authenticators include the following: passwords, key cards, cryptographic devices, and one-time password devices. Initial authenticator content is the actual content of the authenticator, for example, the initial password. In contrast, the requirements about authenticator content include the minimum password length. Developers ship system components with factory default authentication credentials to allow for initial installation and configuration. Default authentication credentials are often well known, easily discoverable, and present a significant security risk. Systems support authenticator management by organization-defined settings and restrictions for various authenticator characteristics including minimum password length, validation time window for time synchronous one-time tokens, and number of allowed rejections during the verification stage of biometric authentication. Authenticator management includes issuing and revoking, when no longer needed, authenticators for temporary access such as that required for remote maintenance. Device authenticators include certificates and passwords."
  children = [
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_5_3" {
  title       = "3.5.3 Use multifactor authentication for local and network access to privileged accounts and for network access to non-privileged accounts"
  description = "Multifactor authentication requires the use of two or more different factors to authenticate. The factors are defined as something you know (e.g., password, personal identification number [PIN]); something you have (e.g., cryptographic identification device, token); or something you are (e.g., biometric). Multifactor authentication solutions that feature physical authenticators include hardware authenticators providing time-based or challenge-response authenticators and smart cards. In addition to authenticating users at the system level (i.e., at logon), organizations may also employ authentication mechanisms at the application level, when necessary, to provide increased information security. Access to organizational systems is defined as local access or network access. Local access is any access to organizational systems by users (or processes acting on behalf of users) where such access is obtained by direct connections without the use of networks. Network access is access to systems by users (or processes acting on behalf of users) where such access is obtained through network connections (i.e., nonlocal accesses). Remote access is a type of network access that involves communication through external networks. The use of encrypted virtual private networks for connections between organization-controlled and non-organization controlled endpoints may be treated as internal networks with regard to protecting the confidentiality of information."
  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_5_5" {
  title       = "3.5.5 Prevent reuse of identifiers for a defined period"
  description = "Identifiers are provided for users, processes acting on behalf of users, or devices (3.5.1). Preventing reuse of identifiers implies preventing the assignment of previously used individual, group, role, or device identifiers to different individuals, groups, roles, or devices."
  children = [
    control.iam_account_password_policy_reuse_24,
    control.iam_password_policy_expire_90
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_5_6" {
  title       = "3.5.6 Disable identifiers after a defined period of inactivity"
  description = "Inactive identifiers pose a risk to organizational information because attackers may exploit an inactive identifier to gain undetected access to organizational devices. The owners of the inactive accounts may not notice if unauthorized access to the account has been obtained."
  children = [
    control.iam_account_password_policy_reuse_24,
    control.iam_password_policy_expire_90,
    control.iam_user_unused_credentials_90
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_5_7" {
  title       = "3.5.7 Enforce a minimum password complexity and change of characters when new passwords are created"
  description = "This requirement applies to single-factor authentication of individuals using passwords as individual or group authenticators, and in a similar manner, when passwords are used as part of multifactor authenticators. The number of changed characters refers to the number of changes required with respect to the total number of positions in the current password. To mitigate certain brute force attacks against passwords, organizations may also consider salting passwords."
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

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_5_8" {
  title       = "3.5.8 Prohibit password reuse for a specified number of generations"
  description = "Password lifetime restrictions do not apply to temporary passwords."
  children = [
    control.iam_account_password_policy_reuse_24,
    control.iam_password_policy_expire_90,
    control.iam_user_unused_credentials_90
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_5_10" {
  title       = "3.5.10 Store and transmit only cryptographically-protected passwords"
  description = "Cryptographically-protected passwords use salted one-way cryptographic hashes of passwords."
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

  tags = local.nist_800_171_rev_2_common_tags
}

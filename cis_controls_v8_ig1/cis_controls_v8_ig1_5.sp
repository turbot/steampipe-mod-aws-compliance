benchmark "cis_controls_v8_ig1_5" {
  title       = "5 Account Management"
  description = "Use processes and tools to assign and manage authorization to credentials for user accounts, including administrator accounts, as well as service accounts, to enterprise assets and software."
  children = [
    benchmark.cis_controls_v8_ig1_5_2,
    benchmark.cis_controls_v8_ig1_5_3,
    benchmark.cis_controls_v8_ig1_5_4
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_5_2" {
  title       = "5.2 Use Unique Passwords"
  description = "Use unique passwords for all enterprise assets. Best practice implementation includes, at a minimum, an 8-character password for accounts using MFA and a 14-character password for accounts not using MFA."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_5_3" {
  title       = "5.3 Disable Dormant Accounts"
  description = "Delete or disable any dormant accounts after a period of 45 days of inactivity, where supported."
  children = [
    control.iam_user_unused_credentials_90
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_5_4" {
  title       = "5.4 Restrict Administrator Privileges to Dedicated Administrator Accounts"
  description = "Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user's primary, non-privileged account."
  children = [
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}
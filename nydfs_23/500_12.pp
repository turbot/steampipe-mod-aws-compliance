benchmark "nydfs_23_500_12" {
  title       = "500.12 Multi-factor Authentication"
  description = "Multi-factor authentication Requirement: (a) Multifactor authentication shall be utilized for any individual accessing any information systems of a covered entity, unless the covered entity qualifies for a limited exemption pursuant to section 500.19(a) of this Part in which case multi-factor authentication shall be utilized for: (1) remote access to the covered entity’s information systems; (2) remote access to thirdparty applications, including but not limited to those that are cloud based, from which nonpublic information is accessible."

  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = local.nydfs_23_common_tags
}


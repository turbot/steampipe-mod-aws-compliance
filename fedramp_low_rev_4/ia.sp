benchmark "fedramp_low_rev_4_ia" {
  title       = benchmark.nist_800_53_rev_4_ia.title
  description = benchmark.nist_800_53_rev_4_ia.description
  children = [
    benchmark.fedramp_low_rev_4_ia_2
  ]

  tags = merge(local.fedramp_low_rev_4_common_tags, {
    service  = "AWS/IAM"
  })
}

benchmark "fedramp_low_rev_4_ia_2" {
  title       = benchmark.nist_800_53_rev_4_ia_2.title
  description = benchmark.nist_800_53_rev_4_ia_2.description
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.fedramp_low_rev_4_common_tags, {
    service  = "AWS/IAM"
  })
}

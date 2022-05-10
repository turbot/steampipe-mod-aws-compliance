benchmark "fedramp_ia" {
  title       = benchmark.nist_800_53_rev_4_cm.title
  description = benchmark.nist_800_53_rev_4_cm.description
  children = [
    benchmark.fedramp_ia_2,
    benchmark.fedramp_ia_5
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_ia_2" {
  title       = benchmark.nist_800_53_rev_4_ia_2.title
  description = benchmark.nist_800_53_rev_4_ia_2.description
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_root_user_no_access_keys,
    benchmark.fedramp_ia_2_1
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_ia_2_1" {
  title       = benchmark.nist_800_53_rev_4_ia_2_1.title
  description = benchmark.nist_800_53_rev_4_ia_2_1.description
  children = [
    control.iam_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    benchmark.fedramp_ia_2_1_2
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_ia_2_1_2" {
  title       = "IA-2(1)(2)"
  description = "(1) The information system implements multifactor authentication for network access to privileged accounts. (2) The information system implements multifactor authentication for network access to non- privileged accounts."
  children = [
    control.iam_root_user_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_ia_5" {
  title       = benchmark.nist_800_53_rev_4_ia_5.title
  description = benchmark.nist_800_53_rev_4_ia_5.description
  children = [
    benchmark.fedramp_ia_5_1,
    benchmark.fedramp_ia_5_4,
    benchmark.fedramp_ia_5_7,
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_ia_5_1" {
  title       = benchmark.nist_800_53_rev_4_ia_5.title
  description = benchmark.nist_800_53_rev_4_ia_5.description
  children = [
    benchmark.fedramp_ia_5_1_a_d_e
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_ia_5_1_a_d_e" {
  title       = "IA-5(1)(a)(d)(e)"
  description = "The information system, for password-based authentication: a. Enforces minimum password complexity of [Assignment: organization-defined requirements for case sensitivity, number of characters, mix of upper-case letters, lower-case letters, numbers, and special characters, including minimum requirements for each type]; d. Enforces password minimum and maximum lifetime restrictions of [Assignment: organization- defined numbers for lifetime minimum, lifetime maximum]; e. Prohibits password reuse for 24 generations"
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = local.fedramp_common_tags
}


benchmark "fedramp_ia_5_4" {
  title       = benchmark.nist_800_53_rev_4_ia_5_4.title
  description = benchmark.nist_800_53_rev_4_ia_5_4.description
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_ia_5_7" {
  title       = benchmark.nist_800_53_rev_4_ia_5_7.title
  description = benchmark.nist_800_53_rev_4_ia_5_7.description
  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values
  ]

  tags = local.fedramp_common_tags
}
benchmark "nist_800_53_rev_5_ia" {
  title       = "Identification and Authentication (IA)"
  description = "IA controls are specific to the identification and authentication policies in an organization. This includes the identification and authentication of organizational and non-organizational users and how the management of those systems."
  children = [
    benchmark.nist_800_53_rev_5_ia_2,
    benchmark.nist_800_53_rev_5_ia_3,
    benchmark.nist_800_53_rev_5_ia_4,
    benchmark.nist_800_53_rev_5_ia_5,
    benchmark.nist_800_53_rev_5_ia_8
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ia_2" {
  title       = "Identification and Authentication (Organizational users) (IA-2)"
  description = "The information system uniquely identifies and authenticates organizational users (or processes acting on behalf of organizational users)."
  children = [
    benchmark.nist_800_53_rev_5_ia_2_1,
    benchmark.nist_800_53_rev_5_ia_2_2,
    benchmark.nist_800_53_rev_5_ia_2_6,
    benchmark.nist_800_53_rev_5_ia_2_8,
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_1" {
  title       = "IA-2(1) Multi-Factor Authentication To Privileged Accounts"
  description = "Implement multi-factor authentication for access to privileged accounts."
  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_2" {
  title       = "IA-2(2) Multi-Factor Authentication To Non-Privileged Accounts"
  description = "Implement multi-factor authentication for access to non-privileged accounts."
  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_6" {
  title       = "IA-2(6) Acces To Accounts — Separate Device"
  description = "Implement multi-factor authentication for [Selection (one or more): local; network; remote] access to [Selection (one or more): privileged accounts; non-privileged accounts] such that: (a) One of the factors is provided by a device separate from the system gaining access; and (b) The device meets [Assignment: organization-defined strength of mechanism requirements]."
  children = [
    benchmark.nist_800_53_rev_5_ia_2_6_a,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_6_a" {
  title       = "IA-2(6)(a)"
  description = "Implement multi-factor authentication for [Selection (one or more): local; network; remote] access to [Selection (one or more): privileged accounts; non-privileged accounts] such that: (a) One of the factors is provided by a device separate from the system gaining access."
  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_2_8" {
  title       = "IA-2(8) Access To Accounts — Replay Resistant"
  description = "Implement replay-resistant authentication mechanisms for access to [Selection (one or more): privileged accounts; non-privileged accounts]."
  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_3" {
  title       = "Device Identification And Authentication (IA-3)"
  description = "Uniquely identify and authenticate [Assignment: organization-defined devices and/or types of devices] before establishing a [Selection (one or more): local; remote; network] connection."
  children = [
    benchmark.nist_800_53_rev_5_ia_3_3
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ia_3_3" {
  title       = "IA-3(3) Dynamic Address Allocation"
  description = "a. Where addresses are allocated dynamically, standardize dynamic address allocation lease information and the lease duration assigned to devices in accordance with [Assignment: organization-defined lease information and lease duration]; and b. Audit lease information when assigned to a device."
  children = [
    benchmark.nist_800_53_rev_5_ia_3_3_b

  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ia_3_3_b" {
  title       = "IA-3(3)(b)"
  description = "Audit lease information when assigned to a device."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.wafv2_web_acl_logging_enabled,
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ia_4" {
  title       = "Identifier Management (IA-4)"
  description = "Manage information system identifiers for users and devices. Automate authorizing and disabling users to prevent misuse."
  children = [
    benchmark.nist_800_53_rev_5_ia_4_8,
    benchmark.nist_800_53_rev_5_ia_4_b,
    benchmark.nist_800_53_rev_5_ia_4_d,
    benchmark.nist_800_53_rev_5_ia_4_4
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_4_b" {
  title       = "IA-4(b)"
  description = "Manage system identifiers by: b. Selecting an identifier that identifies an individual, group, role, service, or device."
  children = [
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_4_d" {
  title       = "IA-4(d)"
  description = "Manage system identifiers by: d. Preventing reuse of identifiers for [Assignment: organization-defined time period]."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_4_4" {
  title       = "IA-4(4)"
  description = "Manage individual identifiers by uniquely identifying each individual as [Assignment: organization-defined characteristic identifying individual status]."
  children = [
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_4_8" {
  title       = "IA-4(8)"
  description = "Generate pairwise pseudonymous identifiers."
  children = [
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5" {
  title       = "Authenticator Management (IA-5)"
  description = "Authenticate users and devices. Automate administrative control. Enforce restrictions. Protect against unauthorized use."
  children = [
    benchmark.nist_800_53_rev_5_ia_5_1,
    benchmark.nist_800_53_rev_5_ia_5_8,
    benchmark.nist_800_53_rev_5_ia_5_18,
    benchmark.nist_800_53_rev_5_ia_5_b,
    benchmark.nist_800_53_rev_5_ia_5_c,
    benchmark.nist_800_53_rev_5_ia_5_d,
    benchmark.nist_800_53_rev_5_ia_5_f,
    benchmark.nist_800_53_rev_5_ia_5_h,
    control.iam_account_password_policy_min_length_14
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ia_5_b" {
  title       = "IA-5(b)"
  description = "Manage system authenticators by: b. Establishing initial authenticator content for any authenticators issued by the organization."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_c" {
  title       = "IA-5(c)"
  description = "Manage system authenticators by: c. Ensuring that authenticators have sufficient strength of mechanism for their intended use."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

    tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_d" {
  title       = "IA-5(d)"
  description = "Manage system authenticators by: d. Establishing and implementing administrative procedures for initial authenticator distribution, for lost or compromised or damaged authenticators, and for revoking authenticators."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_f" {
  title       = "IA-5(f)"
  description = "Manage system authenticators by: f. Changing or refreshing authenticators [Assignment: organization-defined time period by authenticator type] or when [Assignment: organization-defined events] occur."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_h" {
  title       = "IA-5(h)"
  description = "Manage system authenticators by: h. Requiring individuals to take, and having devices implement, specific controls to protect authenticators."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_1" {
  title       = "IA-5(1) Password-Based Authentication"
  description = "The information system, for password-based authentication that enforces  minimum password complexity, stores and transmits only cryptographically-protected passwords, enforces password minimum and maximum lifetime restrictions, prohibits password reuse, allows the use of a temporary password for system logons with an immediate change to a permanent password etc."
  children = [
    benchmark.nist_800_53_rev_5_ia_5_1_c,
    benchmark.nist_800_53_rev_5_ia_5_1_f,
    benchmark.nist_800_53_rev_5_ia_5_1_g,
    benchmark.nist_800_53_rev_5_ia_5_1_h
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ia_5_1_c" {
  title       = "IA-5(1)(c)"
  description = "For password-based authentication: (c) Transmit passwords only over cryptographically-protected channels."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ia_5_1_f" {
  title       = "IA-5(1)(f)"
  description = "For password-based authentication: (f) Allow user selection of long passwords and passphrases, including spaces and all printable characters."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_1_g" {
  title       = "IA-5(1)(g)"
  description = "For password-based authentication: (g) Employ automated tools to assist the user in selecting strong password authenticators."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_1_h" {
  title       = "IA-5(1)(h)"
  description = "For password-based authentication: (h) Enforce the following composition and complexity rules: [Assignment: organization-defined composition and complexity rules]."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_8" {
  title       = "IA-5(8) Multiple System Accounts"
  description = "Implement [Assignment: organization-defined security controls] to manage the risk of compromise due to individuals having accounts on multiple systems."
  children = [
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_18" {
  title       = "IA-5(18) Password Managers"
  description = "a. Employ [Assignment: organization-defined password managers] to generate and manage passwords; and b. Protect the passwords using [Assignment: organization-defined controls]."
  children = [
    benchmark.nist_800_53_rev_5_ia_5_18_a,
    benchmark.nist_800_53_rev_5_ia_5_18_b
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_18_a" {
  title       = "IA-5(18)(a)"
  description = "Employ [Assignment: organization-defined password managers] to generate and manage passwords."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_5_18_b" {
  title       = "IA-5(18)(b)"
  description = "Protect the passwords using [Assignment: organization-defined controls]."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_8" {
  title       = "Identification And Authentication (Non-Organizational Users) (IA-8)"
  description = "Uniquely identify and authenticate non-organizational users or processes acting on behalf of non-organizational users."
  children = [
    benchmark.nist_800_53_rev_5_ia_8_2
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_8_2" {
  title       = "IA-8(2) Acceptance Of External Authenticators"
  description = "Uniquely identify and authenticate non-organizational users or processes acting on behalf of non-organizational users."
  children = [
    benchmark.nist_800_53_rev_5_ia_8_2_b
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ia_8_2_b" {
  title       = "IA-8(2)(b)"
  description = "Document and maintain a list of accepted external authenticators."
  children = [
   control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}


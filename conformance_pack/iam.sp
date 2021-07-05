locals {
  conformance_pack_iam_common_tags = {
    service = "iam"
  }
}

control "iam_account_password_policy_strong_min_reuse_24" {
  title       = "IAM password policies for users should have strong configurations"
  description = "The identities and the credentials are issued, managed, and verified based on an organizational IAM password policy."
  sql         = query.iam_account_password_policy_strong_min_reuse_24.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    rbi_cyber_security = "true"
  })
}

control "iam_group_not_empty" {
  title       = "IAM groups should have at least one user"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, by ensuring that IAM groups have at least one IAM user."
  sql         = query.iam_group_not_empty.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa             = "true"
    nist_csf          = "true"
    nist_800_53_rev_4 = "true"
  })
}

control "iam_policy_no_star_star" {
  title       = "IAM policy should not have statements with admin access"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'."
  sql         = query.iam_policy_no_star_star.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa              = "true"
    nist_csf           = "true"
    nist_800_53_rev_4  = "true"
    rbi_cyber_security = "true"
  })
}

control "iam_root_user_no_access_keys" {
  title       = "IAM root user should not have access keys"
  description = "Access to systems and assets can be controlled by checking that the root user does not have access keys attached to their AWS Identity and Access Management (IAM) role."
  sql         = query.iam_root_user_no_access_keys.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa              = "true"
    nist_csf           = "true"
    nist_800_53_rev_4  = "true"
    rbi_cyber_security = "true"
  })
}

control "iam_root_user_hardware_mfa_enabled" {
  title       = "IAM root user hardware MFA should be enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring hardware MFA is enabled for the root user."
  sql         = query.iam_root_user_hardware_mfa_enabled.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa    = "true"
    nist_csf = "true"
  })
}

control "iam_root_user_mfa_enabled" {
  title       = "IAM root user MFA should be enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring MFA is enabled for the root user."
  sql         = query.iam_root_user_mfa_enabled.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa             = "true"
    nist_csf          = "true"
    nist_800_53_rev_4 = "true"
  })
}

control "iam_user_access_key_age_90" {
  title       = "IAM user access keys should be rotated at least every 90 days"
  description = "The credentials are audited for authorized devices, users, and processes by ensuring IAM access keys are rotated as per organizational policy."
  sql         = query.iam_user_access_key_age_90.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa             = "true"
    nist_csf          = "true"
    nist_800_53_rev_4 = "true"
  })
}

control "iam_user_console_access_mfa_enabled" {
  title       = "IAM users with console access should have MFA enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring that MFA is enabled for all AWS Identity and Access Management (IAM) users that have a console password."
  sql         = query.iam_user_console_access_mfa_enabled.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa    = "true"
    nist_csf = "true"
  })
}

control "iam_user_mfa_enabled" {
  title       = "IAM user MFA should be enabled"
  description = "Enable this rule to restrict access to resources in the AWS Cloud."
  sql         = query.iam_user_mfa_enabled.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa    = "true"
    nist_csf = "true"
  })
}

control "iam_user_no_inline_attached_policies" {
  title       = "IAM user should not have any inline or attached policies"
  description = "This rule ensures AWS Identity and Access Management (IAM) policies are attached only to groups or roles to control access to systems and assets."
  sql         = query.iam_user_no_inline_attached_policies.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa              = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "iam_user_unused_credentials_90" {
  title       = "IAM user credentials that have not been used in 90 days should be disabled"
  description = "AWS Identity and Access Management (IAM) can help you with access permissions and authorizations by checking for IAM passwords and access keys that are not used for a specified time period."
  sql         = query.iam_user_unused_credentials_90.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa             = "true"
    nist_csf          = "true"
    nist_800_53_rev_4 = "true"
  })
}

control "iam_user_in_group" {
  title       = "IAM users should be in at least one group"
  description = "AWS Identity and Access Management (IAM) can help you restrict access permissions and authorizations, by ensuring IAM users are members of at least one group."
  sql         = query.iam_user_in_group.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    hipaa             = "true"
    nist_csf          = "true"
    nist_800_53_rev_4 = "true"
  })
}

control "iam_group_user_role_no_inline_policies" {
  title       = "IAM groups, users, and roles should not have any inline policies"
  description = "Ensure an AWS Identity and Access Management (IAM) user, IAM role or IAM group does not have an inline policy to control access to systems and assets."
  sql         = query.iam_group_user_role_no_inline_policies.sql

  tags = merge(local.conformance_pack_iam_common_tags, {
    rbi_cyber_security = "true"
  })
}
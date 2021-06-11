locals {
  conformance_pack_iam_common_tags = {
    service = "iam"
  }
}

control "iam_account_password_policy_strong_min_reuse_24" {
  title       = "Password policies for IAM users should have strong configurations"
  description = "The identities and the credentials are issued, managed, and verified based on an organizational IAM password policy."
  sql         = query.iam_account_password_policy_strong_min_reuse_24.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_group_not_empty" {
  title       = "IAM groups should have at least one IAM user"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, by ensuring that IAM groups have at least one IAM user."
  sql         = query.iam_group_not_empty.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_policy_no_star_star" {
  title       = "IAM policy no statements with admin access"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'."
  sql         = query.iam_policy_no_star_star.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_root_user_access_key" {
  title       = "IAM root user should not have access key"
  description = "Access to systems and assets can be controlled by checking that the root user does not have access keys attached to their AWS Identity and Access Management (IAM) role."
  sql         = query.iam_root_user_access_key.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_root_user_hardware_mfa" {
  title       = "IAM root user hardware MFA should be enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring hardware MFA is enabled for the root user."
  sql         = query.iam_root_user_hardware_mfa.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_root_user_mfa" {
  title       = "IAM root user MFA should be enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring MFA is enabled for the root user."
  sql         = query.iam_root_user_mfa.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_user_access_key_age_90" {
  title       = "IAM user access keys are rotated every 90 days or less"
  description = "The credentials are audited for authorized devices, users, and processes by ensuring IAM access keys are rotated as per organizational policy."
  sql         = query.iam_user_access_key_age_90.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_user_console_access_mfa_enabled" {
  title       = "IAM console access user MFA should be enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring that MFA is enabled for all AWS Identity and Access Management (IAM) users that have a console password."
  sql         = query.iam_user_console_access_mfa_enabled.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_user_mfa_enabled" {
  title       = "IAM user MFA should be enabled"
  description = "Enable this rule to restrict access to resources in the AWS Cloud."
  sql         = query.iam_user_mfa_enabled.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_user_no_policies" {
  title       = "IAM user should not have any policy attached"
  description = "This rule ensures AWS Identity and Access Management (IAM) policies are attached only to groups or roles to control access to systems and assets."
  sql         = query.iam_user_no_policies.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_user_unused_credentials_90" {
  title       = "IAM user credentials unused for 90 days or greater should be disabled"
  description = "AWS Identity and Access Management (IAM) can help you with access permissions and authorizations by checking for IAM passwords and access keys that are not used for a specified time period."
  sql         = query.iam_user_unused_credentials_90.sql
  tags        = local.conformance_pack_iam_common_tags
}

control "iam_user_with_group" {
  title       = "IAM users are members of at least one group"
  description = "AWS Identity and Access Management (IAM) can help you restrict access permissions and authorizations, by ensuring IAM users are members of at least one group."
  sql         = query.iam_user_with_group.sql
  tags        = local.conformance_pack_iam_common_tags
}

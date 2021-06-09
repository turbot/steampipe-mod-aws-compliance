locals {
  hipaa_164_312_d_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_d"
  })
}

benchmark "hipaa_164_312_d" {
  title          = "164.312(d) Person or entity authentication"
  description    = "Implement procedures to verify that a person or entity seeking access to electronic protected health information is the one claimed."
  children = [
    control.hipaa_164_312_d_iam_account_password_policy_strong_min_resuse_24,
    control.hipaa_164_312_d_iam_user_mfa_enabled,
    control.hipaa_164_312_d_iam_user_console_access_mfa_enabled,
    control.hipaa_164_312_d_iam_root_user_hardware_mfa,
    control.hipaa_164_312_d_iam_root_user_mfa,
  ]
  tags          = local.hipaa_164_312_d_common_tags
}

control "hipaa_164_312_d_iam_account_password_policy_strong_min_resuse_24" {
  title         = "Password policies for IAM users should have strong configurations"
  description   = "The identities and the credentials are issued, managed, and verified based on an organizational IAM password policy."
  sql           = query.iam_account_password_policy_strong_min_reuse_24.sql

  tags = merge(local.hipaa_164_312_d_common_tags, {
    service = "iam"
  })
}

control "hipaa_164_312_d_iam_user_mfa_enabled" {
  title         = "IAM user MFA should be enabled"
  description   = "Enable this rule to restrict access to resources in the AWS Cloud. This rule ensures multi-factor authentication (MFA) is enabled for all IAM users"
  sql           = query.iam_user_mfa_enabled.sql

  tags = merge(local.hipaa_164_312_d_common_tags, {
    service = "iam"
  })
}

control "hipaa_164_312_d_iam_user_console_access_mfa_enabled" {
  title         = "IAM user with console password should have MFA enabled"
  description   = "Manage access to resources in the AWS Cloud by ensuring that MFA is enabled for all AWS Identity and Access Management (IAM) users that have a console password."
  sql           = query.iam_user_console_access_mfa_enabled.sql

  tags = merge(local.hipaa_164_312_d_common_tags, {
    service = "iam"
  })
}

control "hipaa_164_312_d_iam_root_user_hardware_mfa" {
  title         = "IAM root user hardware MFA should be enbled"
  description   = "Manage access to resources in the AWS Cloud by ensuring hardware MFA is enabled for the root user."
  sql           = query.iam_root_user_hardware_mfa.sql

  tags = merge(local.hipaa_164_312_d_common_tags, {
    service = "iam"
  })
}

control "hipaa_164_312_d_iam_root_user_mfa" {
  title         = "IAM root user MFA should be enabled"
  description   = "Manage access to resources in the AWS Cloud by ensuring MFA is enabled for the root user."
  sql           = query.iam_root_user_mfa.sql

  tags = merge(local.hipaa_164_312_d_common_tags, {
    service = "iam"
  })
}
locals {
  extra_checks_iam_common_tags = merge(local.extra_checks_common_tags, {
    service = "iam"
  })
}

benchmark "group_iam" {
  title       = "IAM Checks"
  description = "This group of SNS extra checks shows results of controls related to SNS service."
  children = [
    control.iam_user_with_administrator_group_mfa_enabled
  ]

  tags = local.extra_checks_iam_common_tags
}

control "iam_user_with_administrator_group_mfa_enabled" {
  title       = "Ensure users of groups with AdministratorAccess policy have MFA tokens enable"
  description = "AWS Multi-Factor Authentication (MFA) is a simple best practice that adds an extra layer of protection on top of your user name and password. It is recommended to ensure users of groups with administrator access policy have MFA tokens enabled."
  sql         = query.iam_user_with_administrator_group_mfa_enabled.sql

  tags = merge(local.extra_checks_iam_common_tags, {
    extra_check_category = "infrastructure_security"
  })
}
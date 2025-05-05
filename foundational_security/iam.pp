locals {
  foundational_security_iam_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "foundational_security_iam" {
  title         = "IAM"
  documentation = file("./foundational_security/docs/foundational_security_iam.md")
  children = [
    control.foundational_security_iam_1,
    control.foundational_security_iam_2,
    control.foundational_security_iam_3,
    control.foundational_security_iam_4,
    control.foundational_security_iam_5,
    control.foundational_security_iam_6,
    control.foundational_security_iam_7,
    control.foundational_security_iam_8,
    control.foundational_security_iam_21,
    control.foundational_security_iam_22
  ]

  tags = merge(local.foundational_security_iam_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_iam_1" {
  title         = "1 IAM policies should not allow full '*' administrative privileges"
  description   = "This control checks whether the default version of IAM policies (also known as customer managed policies) has administrator access that includes a statement with 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'. The control only checks the customer managed policies that you create. It does not check inline and AWS managed policies."
  severity      = "high"
  query         = query.iam_policy_custom_attached_no_star_star
  documentation = file("./foundational_security/docs/foundational_security_iam_1.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_1"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_iam_2" {
  title         = "2 IAM users should not have IAM policies attached"
  description   = "This control checks that none of your IAM users have policies attached. Instead, IAM users must inherit permissions from IAM groups or roles."
  severity      = "low"
  query         = query.iam_user_no_inline_attached_policies
  documentation = file("./foundational_security/docs/foundational_security_iam_2.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_2"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_iam_3" {
  title         = "3 IAM users' access keys should be rotated every 90 days or less"
  description   = "This control checks whether the active access keys are rotated within 90 days."
  severity      = "medium"
  query         = query.iam_user_access_key_age_90
  documentation = file("./foundational_security/docs/foundational_security_iam_3.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_3"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_iam_4" {
  title         = "4 IAM root user access key should not exist"
  description   = "This control checks whether the root user access key is present. The root account is the most privileged user in an AWS account. AWS access keys provide programmatic access to a given account."
  severity      = "critical"
  query         = query.iam_root_user_no_access_keys
  documentation = file("./foundational_security/docs/foundational_security_iam_4.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_4"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_iam_5" {
  title         = "5 MFA should be enabled for all IAM users that have a console password"
  description   = "This control checks whether AWS multi-factor authentication (MFA) is enabled for all IAM users that use a console password."
  severity      = "medium"
  query         = query.iam_user_console_access_mfa_enabled
  documentation = file("./foundational_security/docs/foundational_security_iam_5.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_5"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_iam_6" {
  title         = "6 Hardware MFA should be enabled for the root user"
  description   = "This control checks whether your AWS account is enabled to use a hardware multi-factor authentication (MFA) device to sign in with root user credentials."
  severity      = "critical"
  query         = query.iam_root_user_hardware_mfa_enabled
  documentation = file("./foundational_security/docs/foundational_security_iam_6.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_6"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_iam_7" {
  title         = "7 Password policies for IAM users should have strong configurations"
  description   = "This control checks whether the account password policy for IAM users uses the recommended configurations."
  severity      = "medium"
  query         = query.iam_account_password_policy_strong_min_length_8
  documentation = file("./foundational_security/docs/foundational_security_iam_7.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_7"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_iam_8" {
  title         = "8 Unused IAM user credentials should be removed"
  description   = "This control checks whether your IAM users have passwords or active access keys that have not been used for 90 days."
  severity      = "medium"
  query         = query.iam_user_unused_credentials_90
  documentation = file("./foundational_security/docs/foundational_security_iam_8.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_8"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_iam_21" {
  title         = "21 IAM customer managed policies that you create should not allow wildcard actions for services"
  description   = "This control checks whether the IAM identity-based policies that you create have Allow statements that use the * wildcard to grant permissions for all actions on any service. The control fails if any policy statement includes 'Effect': 'Allow' with 'Action': 'Service:*'."
  severity      = "low"
  query         = query.iam_all_policy_no_service_wild_card
  documentation = file("./foundational_security/docs/foundational_security_iam_21.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_21"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_iam_22" {
  title         = "22 IAM roles should not have cross-account write access policies"
  description   = "This control checks whether IAM roles have policies that allow write access to resources in other AWS accounts. Such policies can pose a security risk as they may allow unauthorized access to resources in other accounts."
  severity      = "high"
  query         = query.iam_role_cross_account_write_access_policy
  documentation = file("./foundational_security/docs/foundational_security_iam_22.md")

  tags = merge(local.foundational_security_iam_common_tags, {
    foundational_security_item_id  = "iam_22"
    foundational_security_category = "secure_access_management"
  })
}

query "iam_role_cross_account_write_access_policy" {
  sql = <<-EOQ
    with cross_account_write_policies as (
      select
        r.arn as role_arn,
        r.account_id,
        r.region,
        p.arn as policy_arn,
        p.policy_std
      from
        aws_iam_role as r
        cross join jsonb_array_elements_text(r.attached_policy_arns) as policy_arn
        join aws_iam_policy as p on p.arn = policy_arn
      where
        p.policy_std -> 'Statement' @> '[{"Effect": "Allow", "Principal": {"AWS": ["*"]}}]'
        or p.policy_std -> 'Statement' @> '[{"Effect": "Allow", "Principal": {"Service": ["*"]}}]'
        and (
          p.policy_std -> 'Statement' @> '[{"Action": ["*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Put*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Delete*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Create*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Update*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Modify*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Attach*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Detach*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Replace*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Tag*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Untag*"]}]'
        )
    )
    select
      r.arn as resource,
      case
        when c.role_arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when c.role_arn is null then 'Role does not have cross-account write access'
        else 'Role has cross-account write access'
      end as reason,
      r.account_id
    from
      aws_iam_role as r
      left join cross_account_write_policies as c on r.arn = c.role_arn;
  EOQ
}

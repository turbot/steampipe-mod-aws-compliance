locals {
  control_tower_multi_factor_authentication_common_tags = merge(local.control_tower_common_tags, {
    control_set = "multi_factor_authentication"
  })
}

benchmark "control_tower_multi_factor_authentication" {
  title         = "Multi-Factor Authentication"
  description   = "This benchmark checks if MFA is enabled for all the IAM users."
  children = [
    benchmark.control_tower_multi_factor_authentication_3_0_1,
    benchmark.control_tower_multi_factor_authentication_3_0_2,
    benchmark.control_tower_multi_factor_authentication_3_0_3,
  ]
  tags          = local.control_tower_multi_factor_authentication_common_tags
}

benchmark "control_tower_multi_factor_authentication_3_0_1" {
  title         = "3.0.1 - Disallow access to IAM users without MFA"
  description   = "Disallow access to IAM users without MFA - Checks whether the AWS Identity and Access Management users have multi-factor authentication (MFA) enabled."
  children = [
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.control_tower_multi_factor_authentication_common_tags, {
    control_tower_item_id  = "3.0.1"
  })
}
benchmark "control_tower_multi_factor_authentication_3_0_2" {
  title         = "3.0.2 - Disallow console access to IAM users without MFA"
  description   = "Disallow console access to IAM users without MFA - Checks whether AWS Multi-Factor Authentication (MFA) is enabled for all AWS Identity and Access Management (IAM) users that use a console password."
  children = [
    control.iam_user_console_access_mfa_enabled
  ]

  tags = merge(local.control_tower_multi_factor_authentication_common_tags, {
    control_tower_item_id  = "3.0.2"
  })
}

benchmark "control_tower_multi_factor_authentication_3_0_3" {
  title         = "3.0.3 - Enable MFA for the root user"
  description   = "Enable MFA for the root user - Checks whether the root user of your AWS account requires multi-factor authentication for console sign-in."
  children = [
    control.iam_root_user_mfa_enabled
  ]

  tags = merge(local.control_tower_multi_factor_authentication_common_tags, {
    control_tower_item_id  = "3.0.3"
  })
}
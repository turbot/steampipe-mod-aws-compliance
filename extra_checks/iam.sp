locals {
  extra_checks_iam_common_tags = merge(local.extra_checks_common_tags, {
     type = "Benchmark"
  })
}

benchmark "extra_checks_iam" {
  title       = "IAM Extra Checks"
  description = "TODO"
  children = [
    control.iam_policy_custom_no_assume_role,
    control.iam_user_hardware_mfa_enabled,
    control.iam_user_with_administrator_access_mfa_enabled,


  ]

  tags = local.extra_checks_iam_common_tags
}

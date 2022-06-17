locals {
  extra_checks_kms_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_kms" {
  title       = "KMS Extra Checks"
  description = "TODO"
  children = [
    control.kms_cmk_policy_prohibit_public_access
  ]

  tags = local.extra_checks_kms_common_tags
}

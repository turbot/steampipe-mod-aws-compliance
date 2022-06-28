locals {
  extra_checks_kms_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_kms" {
  title       = "KMS"
  description = "This benchmark contains additional checks for AWS KMS service, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.kms_cmk_policy_prohibit_public_access
  ]

  tags = local.extra_checks_kms_common_tags
}

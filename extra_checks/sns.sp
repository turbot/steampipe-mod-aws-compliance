locals {
  extra_checks_sns_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_sns" {
  title       = "SNS"
  description = "This benchmark contains additional checks for AWS SNS servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.sns_topic_policy_prohibit_public_access
  ]

  tags = local.extra_checks_sns_common_tags
}



locals {
  extra_checks_sqs_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_sqs" {
  title       = "SQS"
  description = "This benchmark contains additional checks for AWS SQS servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.sqs_queue_policy_prohibit_public_access
  ]

  tags = local.extra_checks_sqs_common_tags
}



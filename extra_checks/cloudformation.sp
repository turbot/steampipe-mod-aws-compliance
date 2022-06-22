locals {
  extra_checks_cloudformation_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_cloudformation" {
  title       = "CloudFormation"
  description = "This benchmark contains additional checks for AWS CloudFormation servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.cloudformation_stack_output_no_secrets
  ]

  tags = local.extra_checks_cloudformation_common_tags
}

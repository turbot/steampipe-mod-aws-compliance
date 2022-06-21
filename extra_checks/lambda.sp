locals {
  extra_checks_lambda_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_lambda" {
  title       = "Lambda"
  description = "This benchmark contains additional checks for AWS Lambda servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.lambda_function_logging_enabled
  ]

  tags = local.extra_checks_lambda_common_tags
}

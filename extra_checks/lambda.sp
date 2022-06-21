locals {
  extra_checks_lambda_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_lambda" {
  title       = "Lambda Extra Checks"
  description = "TODO"
  children = [
    control.lambda_function_logging_enabled
  ]

  tags = local.extra_checks_lambda_common_tags
}

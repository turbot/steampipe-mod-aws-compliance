locals {
  all_controls_lambda_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Lambda"
  })
}

benchmark "all_controls_lambda" {
  title       = "Lambda"
  description = "This section contains recommendations for configuring Lambda resources."
  children = [
    control.lambda_function_cloudtrail_logging_enabled,
    control.lambda_function_cloudwatch_insights_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_cors_configuration,
    control.lambda_function_dead_letter_queue_configured,
    control.lambda_function_encryption_enabled,
    control.lambda_function_in_vpc,
    control.lambda_function_logging_config_enabled,
    control.lambda_function_multiple_az_configured,
    control.lambda_function_restrict_public_access,
    control.lambda_function_restrict_public_url,
    control.lambda_function_tracing_enabled,
    control.lambda_function_use_latest_runtime,
    control.lambda_function_variables_no_sensitive_data,
  ]

  tags = merge(local.all_controls_lambda_common_tags, {
    type = "Benchmark"
  })
}

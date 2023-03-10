locals {
  conformance_pack_lambda_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Lambda"
  })
}

control "lambda_function_dead_letter_queue_configured" {
  title       = "Lambda functions should be configured with a dead-letter queue"
  description = "Enable this rule to help notify the appropriate personnel through Amazon Simple Queue Service (Amazon SQS) or Amazon Simple Notification Service (Amazon SNS) when a function has failed."
  query       = query.lambda_function_dead_letter_queue_configured

  tags = merge(local.conformance_pack_lambda_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    nist_800_171_rev_2     = "true"
    soc_2                  = "true"
  })
}

control "lambda_function_in_vpc" {
  title       = "Lambda functions should be in a VPC"
  description = "Deploy AWS Lambda functions within an Amazon Virtual Private Cloud (Amazon VPC) for a secure communication between a function and other services within the Amazon VPC."
  query       = query.lambda_function_in_vpc

  tags = merge(local.conformance_pack_lambda_common_tags, {
    cis_controls_v8_ig1    = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "lambda_function_restrict_public_access" {
  title       = "Lambda functions should restrict public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS Lambda functions cannot be publicly accessed."
  query       = query.lambda_function_restrict_public_access

  tags = merge(local.conformance_pack_lambda_common_tags, {
    cis_controls_v8_ig1    = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "lambda_function_concurrent_execution_limit_configured" {
  title       = "Lambda functions concurrent execution limit configured"
  description = "Checks whether the AWS Lambda function is configured with function-level concurrent execution limit. The control is non compliant if the Lambda function is not configured with function-level concurrent execution limit."
  query       = query.lambda_function_concurrent_execution_limit_configured

  tags = merge(local.conformance_pack_lambda_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "lambda_function_cloudtrail_logging_enabled" {
  title       = "Lambda functions CloudTrail logging should be enabled"
  description = "Lambda functions logging is essential because once lambdas are triggered, all of the underlying compute resources are automatically managed for you. This control is compliant if CloudTrail logging is enabled."
  query       = query.lambda_function_cloudtrail_logging_enabled

  tags = merge(local.conformance_pack_lambda_common_tags, {
    other_checks = "true"
  })
}

control "lambda_function_tracing_enabled" {
  title       = "Lambda functions tracing should be enabled"
  description = "AWS X-Ray can be used to visualize the components of application, identify performance bottlenecks, and troubleshoot requests that resulted in an error. Lambda functions send trace data to X-Ray, and X-Ray processes the data to generate a service map and searchable trace summaries."
  query       = query.lambda_function_tracing_enabled

  tags = merge(local.conformance_pack_lambda_common_tags, {
    other_checks = "true"
  })
}

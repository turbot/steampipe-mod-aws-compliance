locals {
  extra_checks_cloudtrail_common_tags = merge(local.extra_checks_common_tags, {
    service = "cloudtrail"
  })
}

benchmark "group_cloudtrail" {
  title       = "CloudTrail Checks"
  description = "This group of cloudtrail extra checks shows results of controls related to cloudtrail service."
  children = [
    control.cloudtrail_lambda_function_data_events_enabled
  ]

  tags = local.extra_checks_cloudtrail_common_tags
}

control "cloudtrail_lambda_function_data_events_enabled" {
  title       = "Check if Lambda functions invoke API operations are being recorded by CloudTrail"
  description = "If logs are not enabled; monitoring of service use and threat analysis is not possible."
  sql         = query.cloudtrail_lambda_function_data_events_enabled.sql

  tags = merge(local.extra_checks_cloudtrail_common_tags, {
    extra_check_category = "infrastructure_security"
  })
}
locals {
  all_controls_cloudwatch_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/CloudWatch"
  })
}

benchmark "all_controls_cloudwatch" {
  title       = "CloudWatch"
  description = "This section contains recommendations for configuring CloudWatch resources."
  children = [
    control.cloudwatch_alarm_action_enabled,
    control.cloudwatch_alarm_action_enabled_check,
    control.cloudwatch_cross_account_sharing,
    control.cloudwatch_log_group_retention_period_365,
    control.log_group_encryption_at_rest_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_organization,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc
  ]

  tags = merge(local.all_controls_cloudwatch_common_tags, {
    type = "Benchmark"
  })
}

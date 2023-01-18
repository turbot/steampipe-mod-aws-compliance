locals {
  conformance_pack_cloudwatch_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudWatch"
  })
}

control "cloudwatch_alarm_action_enabled" {
  title       = "CloudWatch alarm action should be enabled"
  description = "Amazon CloudWatch alarms alert when a metric breaches the threshold for a specified number of evaluation periods. The alarm performs one or more actions based on the value of the metric or expression relative to a threshold over a number of time periods."
  query       = query.cloudwatch_alarm_action_enabled

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "log_group_encryption_at_rest_enabled" {
  title       = "Log group encryption at rest should be enabled"
  description = "To help protect sensitive data at rest, ensure encryption is enabled for your Amazon CloudWatch Log Group"
  query       = query.log_group_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    gxp_eu_annex_11        = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "cloudwatch_log_group_retention_period_365" {
  title       = "Log group retention period should be at least 365 days"
  description = "Ensure a minimum duration of event log data is retained for your log groups to help with troubleshooting and forensics investigations."
  query       = query.cloudwatch_log_group_retention_period_365

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "log_metric_filter_unauthorized_api" {
  title       = "Ensure a log metric filter and alarm exist for unauthorized API calls"
  description = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for unauthorized API calls."
  query       = query.log_metric_filter_unauthorized_api

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_console_login_mfa" {
  title       = "Ensure a log metric filter and alarm exist for AWS Management Console sign-in without MFA"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm console logins that aren't protected by MFA."
  query       = query.log_metric_filter_console_login_mfa

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    hipaa    = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_root_login" {
  title       = "Ensure a log metric filter and alarm exist for usage of 'root' account"
  description = "You can do real-time monitoring of API calls directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms.Security Hub recommends that you create a metric filter and alarm for root login attempts. Monitoring for root account logins provides visibility into the use of a fully privileged account and an opportunity to reduce the use of it."
  query       = query.log_metric_filter_root_login

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    hipaa    = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_iam_policy" {
  title       = "Ensure a log metric filter and alarm exist for IAM policy changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for changes made to IAM policies. Monitoring these changes helps ensure that authentication and authorization controls remain intact."
  query       = query.log_metric_filter_iam_policy

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_vpc" {
  title       = "Ensure a log metric filter and alarm exist for VPC changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. You can have more than one VPC in an account, and you can create a peer connection between two VPCs, enabling network traffic to route between VPCs. Security Hub recommends that you create a metric filter and alarm for changes to VPCs."
  query       = query.log_metric_filter_vpc

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_route_table" {
  title       = "Ensure a log metric filter and alarm exist for route table changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Routing tables route network traffic between subnets and to network gateways. Security Hub recommends that you create a metric filter and alarm for changes to route tables. Monitoring these changes helps ensure that all VPC traffic flows through an expected path."
  query       = query.log_metric_filter_route_table

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_network_gateway" {
  title       = "Ensure a log metric filter and alarm exist for changes to network gateways"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Network gateways are required to send and receive traffic to a destination outside a VPC. Security Hub recommends that you create a metric filter and alarm for changes to network gateways."
  query       = query.log_metric_filter_network_gateway

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_network_acl" {
  title       = "Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL)"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. NACLs are used as a stateless packet filter to control ingress and egress traffic for subnets in a VPC. Security Hub recommends that you create a metric filter and alarm for changes to NACLs. Monitoring these changes helps ensure that AWS resources and services aren't unintentionally exposed."
  query       = query.log_metric_filter_network_acl

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_security_group" {
  title       = "Ensure a log metric filter and alarm exist for security group changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security groups are a stateful packet filter that controls ingress and egress traffic in a VPC. Security Hub recommends that you create a metric filter and alarm for changes to security groups. Monitoring these changes helps ensure that resources and services aren't unintentionally exposed."
  query       = query.log_metric_filter_security_group

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_config_configuration" {
  title       = "Ensure a log metric filter and alarm exist for AWS Config configuration changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for changes to AWS Config configuration settings. Monitoring these changes helps ensure sustained visibility of configuration items in the account"
  query       = query.log_metric_filter_config_configuration

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_bucket_policy" {
  title       = "Ensure a log metric filter and alarm exist for S3 bucket policy changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for changes to S3 bucket policies. Monitoring these changes might reduce time to detect and correct permissive policies on sensitive S3 buckets."
  query       = query.log_metric_filter_bucket_policy

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_disable_or_delete_cmk" {
  title       = "Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer managed keys"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for customer managed keys that have changed state to disabled or scheduled deletion. Data encrypted with disabled or deleted keys is no longer accessible."
  query       = query.log_metric_filter_disable_or_delete_cmk

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_console_authentication_failure" {
  title       = "Ensure a log metric filter and alarm exist for AWS Management Console authentication failures"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for failed console authentication attempts."
  query       = query.log_metric_filter_console_authentication_failure

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    hipaa    = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_cloudtrail_configuration" {
  title       = "Ensure a log metric filter and alarm exist for CloudTrail configuration changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for changes to CloudTrail configuration settings. Monitoring these changes helps ensure sustained visibility to activities in the account."
  query       = query.log_metric_filter_cloudtrail_configuration

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}



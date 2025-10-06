locals {
  cis_v600_5_common_tags = merge(local.cis_v600_common_tags, {
    cis_section_id = "5"
  })
}

benchmark "cis_v600_5" {
  title         = "5 Monitoring"
  documentation = file("./cis_v600/docs/cis_v600_5.md")
  children = [
    control.cis_v600_5_1,
    control.cis_v600_5_2,
    control.cis_v600_5_3,
    control.cis_v600_5_4,
    control.cis_v600_5_5,
    control.cis_v600_5_6,
    control.cis_v600_5_7,
    control.cis_v600_5_8,
    control.cis_v600_5_9,
    control.cis_v600_5_10,
    control.cis_v600_5_11,
    control.cis_v600_5_12,
    control.cis_v600_5_13,
    control.cis_v600_5_14,
    control.cis_v600_5_15,
    control.cis_v600_5_16
  ]

  tags = merge(local.cis_v600_5_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v600_5_1" {
  title         = "5.1 Ensure unauthorized API calls are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_unauthorized_api
  documentation = file("./cis_v600/docs/cis_v600_5_1.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_2" {
  title         = "5.2 Ensure management console sign-in without MFA is monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_console_login_mfa
  documentation = file("./cis_v600/docs/cis_v600_5_2.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_3" {
  title         = "5.3 Ensure usage of the 'root' account is monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_root_login
  documentation = file("./cis_v600/docs/cis_v600_5_3.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_4" {
  title         = "5.4 Ensure IAM policy changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_iam_policy
  documentation = file("./cis_v600/docs/cis_v600_5_4.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_5" {
  title         = "5.5 Ensure CloudTrail configuration changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_cloudtrail_configuration
  documentation = file("./cis_v600/docs/cis_v600_5_5.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_6" {
  title         = "5.6 Ensure AWS Management Console authentication failures are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_console_authentication_failure
  documentation = file("./cis_v600/docs/cis_v600_5_6.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_7" {
  title         = "5.7 Ensure disabling or scheduled deletion of customer created CMKs is monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_disable_or_delete_cmk
  documentation = file("./cis_v600/docs/cis_v600_5_7.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_8" {
  title         = "5.8 Ensure S3 bucket policy changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_bucket_policy
  documentation = file("./cis_v600/docs/cis_v600_5_8.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_9" {
  title         = "5.9 Ensure AWS Config configuration changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_config_configuration
  documentation = file("./cis_v600/docs/cis_v600_5_9.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.9"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_10" {
  title         = "5.10 Ensure security group changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_security_group
  documentation = file("./cis_v600/docs/cis_v600_5_10.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.10"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_11" {
  title         = "5.11 Ensure Network Access Control List (NACL) changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. NACLs are used as a stateless packet filter to control ingress and egress traffic for subnets within a VPC. It is recommended that a metric filter and alarm be established for any changes made to NACLs."
  query         = query.log_metric_filter_network_acl
  documentation = file("./cis_v600/docs/cis_v600_5_11.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.11"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_12" {
  title         = "5.12 Ensure changes to network gateways are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_network_gateway
  documentation = file("./cis_v600/docs/cis_v600_5_12.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_13" {
  title         = "5.13 Ensure route table changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_route_table
  documentation = file("./cis_v600/docs/cis_v600_5_13.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.13"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_14" {
  title         = "5.14 Ensure VPC changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_vpc
  documentation = file("./cis_v600/docs/cis_v600_5_14.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.14"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_15" {
  title         = "5.15 Ensure AWS Organizations changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_organization
  documentation = file("./cis_v600/docs/cis_v600_5_15.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.15"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v600_5_16" {
  title         = "5.16 Ensure AWS Security Hub is enabled"
  description   = "Security Hub collects security data from various AWS accounts, services, and supported third-party partner products, helping you analyze your security trends and identify the highest-priority security issues. When you enable Security Hub, it begins to consume, aggregate, organize, and prioritize findings from the AWS services that you have enabled, such as Amazon GuardDuty, Amazon Inspector, and Amazon Macie. You can also enable integrations with AWS partner security products."
  query         = query.securityhub_enabled
  documentation = file("./cis_v600/docs/cis_v600_5_16.md")

  tags = merge(local.cis_v600_5_common_tags, {
    cis_item_id = "5.16"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "AWS/SecurityHub"
  })
}

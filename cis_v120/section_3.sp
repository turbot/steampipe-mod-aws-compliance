locals {
  cis_v120_3_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "3"
  })
}

benchmark "cis_v120_3" {
  title         = "3 Monitoring"
  documentation = file("./cis_v120/docs/cis_v120_3.md")
  children = [
    control.cis_v120_3_1,
    control.cis_v120_3_2,
    control.cis_v120_3_3,
    control.cis_v120_3_4,
    control.cis_v120_3_5,
    control.cis_v120_3_6,
    control.cis_v120_3_7,
    control.cis_v120_3_8,
    control.cis_v120_3_9,
    control.cis_v120_3_10,
    control.cis_v120_3_11,
    control.cis_v120_3_12,
    control.cis_v120_3_13,
    control.cis_v120_3_14
  ]

  tags = merge(local.cis_v120_3_common_tags, {
    type    = "Benchmark"
    service = "AWS/CloudWatch"
  })
}

control "cis_v120_3_1" {
  title         = "3.1 Ensure a log metric filter and alarm exist for unauthorized API calls"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for unauthorized API calls."
  query         = query.log_metric_filter_unauthorized_api
  documentation = file("./cis_v120/docs/cis_v120_3_1.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.1"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_2" {
  title         = "3.2 Ensure a log metric filter and alarm exist for Management Console sign-in without MFA"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for console logins that are not protected by multi-factor authentication (MFA)."
  query         = query.log_metric_filter_console_login_mfa
  documentation = file("./cis_v120/docs/cis_v120_3_2.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.2"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_3" {
  title         = "3.3 Ensure a log metric filter and alarm exist for usage of \"root\" account"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for root login attempts."
  query         = query.log_metric_filter_root_login
  documentation = file("./cis_v120/docs/cis_v120_3_3.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.3"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_4" {
  title         = "3.4 Ensure a log metric filter and alarm exist for IAM policy changes"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established changes made to Identity and Access Management (IAM) policies."
  query         = query.log_metric_filter_iam_policy
  documentation = file("./cis_v120/docs/cis_v120_3_4.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.4"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_5" {
  title         = "3.5 Ensure a log metric filter and alarm exist for CloudTrail configuration changes"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for detecting changes to CloudTrail's configurations."
  query         = query.log_metric_filter_cloudtrail_configuration
  documentation = file("./cis_v120/docs/cis_v120_3_5.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.5"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_6" {
  title         = "3.6 Ensure a log metric filter and alarm exist for AWS Management Console authentication failures"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for failed console authentication attempts."
  query         = query.log_metric_filter_console_authentication_failure
  documentation = file("./cis_v120/docs/cis_v120_3_6.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.6"
    cis_level   = "2"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_7" {
  title         = "3.7 Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer created CMKs"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for customer created CMKs which have changed state to disabled or scheduled deletion."
  query         = query.log_metric_filter_disable_or_delete_cmk
  documentation = file("./cis_v120/docs/cis_v120_3_7.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.7"
    cis_level   = "2"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_8" {
  title         = "3.8 Ensure a log metric filter and alarm exist for S3 bucket policy changes"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for changes to S3 bucket policies."
  query         = query.log_metric_filter_bucket_policy
  documentation = file("./cis_v120/docs/cis_v120_3_8.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.8"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_9" {
  title         = "3.9 Ensure a log metric filter and alarm exist for AWS Config configuration changes"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for detecting changes to CloudTrail's configurations."
  query         = query.log_metric_filter_config_configuration
  documentation = file("./cis_v120/docs/cis_v120_3_9.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.9"
    cis_level   = "2"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_10" {
  title         = "3.10 Ensure a log metric filter and alarm exist for security group changes"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Groups are a stateful packet filter that controls ingress and egress traffic within a VPC. It is recommended that a metric filter and alarm be established changes to Security Groups."
  query         = query.log_metric_filter_security_group
  documentation = file("./cis_v120/docs/cis_v120_3_10.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.10"
    cis_level   = "2"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_11" {
  title         = "3.11 Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL)"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. NACLs are used as a stateless packet filter to control ingress and egress traffic for subnets within a VPC. It is recommended that a metric filter and alarm be established for changes made to NACLs."
  query         = query.log_metric_filter_network_acl
  documentation = file("./cis_v120/docs/cis_v120_3_11.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.11"
    cis_level   = "2"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_12" {
  title         = "3.12 Ensure a log metric filter and alarm exist for changes to network gateways"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Network gateways are required to send/receive traffic to a destination outside of a VPC. It is recommended that a metric filter and alarm be established for changes to network gateways."
  query         = query.log_metric_filter_network_gateway
  documentation = file("./cis_v120/docs/cis_v120_3_12.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.12"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_13" {
  title         = "3.13 Ensure a log metric filter and alarm exist for route table changes"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Routing tables are used to route network traffic between subnets and to network gateways. It is recommended that a metric filter and alarm be established for changes to route tables."
  query         = query.log_metric_filter_route_table
  documentation = file("./cis_v120/docs/cis_v120_3_13.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.13"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v120_3_14" {
  title         = "3.14 Ensure a log metric filter and alarm exist for VPC changes"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is possible to have more than 1 VPC within an account, in addition it is also possible to create a peer connection between 2 VPCs enabling network traffic to route between VPCs. It is recommended that a metric filter and alarm be established for changes made to VPCs."
  query         = query.log_metric_filter_vpc
  documentation = file("./cis_v120/docs/cis_v120_3_14.md")

  tags = merge(local.cis_v120_3_common_tags, {
    cis_item_id = "3.14"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/CloudWatch"
  })
}

locals {
  cis_v400_4_common_tags = merge(local.cis_v400_common_tags, {
    cis_section_id = "4"
  })
}

benchmark "cis_v400_4" {
  title         = "4 Monitoring"
  documentation = file("./cis_v400/docs/cis_v400_4.md")
  children = [
    control.cis_v400_4_1,
    control.cis_v400_4_2,
    control.cis_v400_4_3,
    control.cis_v400_4_4,
    control.cis_v400_4_5,
    control.cis_v400_4_6,
    control.cis_v400_4_7,
    control.cis_v400_4_8,
    control.cis_v400_4_9,
    control.cis_v400_4_10,
    control.cis_v400_4_11,
    control.cis_v400_4_12,
    control.cis_v400_4_13,
    control.cis_v400_4_14,
    control.cis_v400_4_15,
    control.cis_v400_4_16
  ]

  tags = merge(local.cis_v400_4_common_tags, {
    type    = "Benchmark"
    service = "AWS/CloudWatch"
  })
}

control "cis_v400_4_1" {
  title         = "4.1 Ensure unauthorized API calls are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms."
  query         = query.log_metric_filter_unauthorized_api
  documentation = file("./cis_v400/docs/cis_v400_4_1.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_2" {
  title         = "4.2 Ensure management console sign-in without MFA is monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for console logins that are not protected by multi-factor authentication (MFA)."
  query         = query.log_metric_filter_console_login_mfa
  documentation = file("./cis_v400/docs/cis_v400_4_2.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_3" {
  title         = "4.3 Ensure usage of the 'root' account is monitoredd"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for 'root' login attempts to detect unauthorized use or attempts to use the root account."
  query         = query.log_metric_filter_root_login
  documentation = file("./cis_v400/docs/cis_v400_4_3.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_4" {
  title         = "4.4 Ensure IAM policy changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for changes made to Identity and Access Management (IAM) policies."
  query         = query.log_metric_filter_iam_policy
  documentation = file("./cis_v400/docs/cis_v400_4_4.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_5" {
  title         = "4.5 Ensure CloudTrail configuration changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be used to detect changes to CloudTrail's configurations."
  query         = query.log_metric_filter_cloudtrail_configuration
  documentation = file("./cis_v400/docs/cis_v400_4_5.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_6" {
  title         = "4.6 Ensure AWS Management Console authentication failures are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for failed console authentication attempts."
  query         = query.log_metric_filter_console_authentication_failure
  documentation = file("./cis_v400/docs/cis_v400_4_6.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_7" {
  title         = "4.7 Ensure disabling or scheduled deletion of customer created CMKs is monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for customer-created CMKs that have changed state to disabled or are scheduled for deletion."
  query         = query.log_metric_filter_disable_or_delete_cmk
  documentation = file("./cis_v400/docs/cis_v400_4_7.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.7"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_8" {
  title         = "4.8 Ensure S3 bucket policy changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for changes to S3 bucket policies."
  query         = query.log_metric_filter_bucket_policy
  documentation = file("./cis_v400/docs/cis_v400_4_8.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_9" {
  title         = "4.9 Ensure AWS Config configuration changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for detecting changes to AWS Config's configurations."
  query         = query.log_metric_filter_config_configuration
  documentation = file("./cis_v400/docs/cis_v400_4_9.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.9"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_10" {
  title         = "4.10 Ensure security group changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. Security groups are stateful packet filters that control ingress and egress traffic within a VPC. It is recommended that a metric filter and alarm be established to detect changes to security groups."
  query         = query.log_metric_filter_security_group
  documentation = file("./cis_v400/docs/cis_v400_4_10.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.10"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_11" {
  title         = "4.11 Ensure Network Access Control List (NACL) changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. NACLs are used as a stateless packet filter to control ingress and egress traffic for subnets within a VPC. It is recommended that a metric filter and alarm be established for any changes made to NACLs."
  query         = query.log_metric_filter_network_acl
  documentation = file("./cis_v400/docs/cis_v400_4_11.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.11"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_12" {
  title         = "4.12 Ensure changes to network gateways are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. Network gateways are required to send and receive traffic to a destination outside of a VPC. It is recommended that a metric filter and alarm be established for changes to network gateways."
  query         = query.log_metric_filter_network_gateway
  documentation = file("./cis_v400/docs/cis_v400_4_12.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_13" {
  title         = "4.13 Ensure route table changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. Routing tables are used to route network traffic between subnets and to network gateways. It is recommended that a metric filter and alarm be established for changes to route tables."
  query         = query.log_metric_filter_route_table
  documentation = file("./cis_v400/docs/cis_v400_4_13.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.13"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_14" {
  title         = "4.14 Ensure VPC changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is possible to have more than one VPC within an account; additionally, it is also possible to create a peer connection between two VPCs, enabling network traffic to route between them. It is recommended that a metric filter and alarm be established for changes made to VPCs."
  query         = query.log_metric_filter_vpc
  documentation = file("./cis_v400/docs/cis_v400_4_14.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.14"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_15" {
  title         = "4.15 Ensure AWS Organizations changes are monitored"
  description   = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs or an external Security Information and Event Management (SIEM) environment, and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for changes made to AWS Organizations in the master AWS account."
  query         = query.log_metric_filter_organization
  documentation = file("./cis_v400/docs/cis_v400_4_15.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.15"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/CloudWatch"
  })
}

control "cis_v400_4_16" {
  title         = "4.16 Ensure AWS Security Hub is enabled"
  description   = "Security Hub collects security data from various AWS accounts, services, and supported third-party partner products, helping you analyze your security trends and identify the highest-priority security issues. When you enable Security Hub, it begins to consume, aggregate, organize, and prioritize findings from the AWS services that you have enabled, such as Amazon GuardDuty, Amazon Inspector, and Amazon Macie. You can also enable integrations with AWS partner security products."
  query         = query.securityhub_enabled
  documentation = file("./cis_v400/docs/cis_v400_4_16.md")

  tags = merge(local.cis_v400_4_common_tags, {
    cis_item_id = "4.16"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "AWS/SecurityHub"
  })
}

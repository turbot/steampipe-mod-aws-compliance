locals {
  hipaa_164_308_a_6_ii_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_6_ii"
  })
}

benchmark "hipaa_164_308_a_6_ii" {
  title       = "164.308(a)(6)(ii) Response and reporting"
  description = "Identify and respond to suspected or known security incidents; mitigate, to the extent practicable, harmful effects of security incidents that are known to the covered entity or business associate; and document security incidents and their outcomes."
  children = [
    control.hipaa_164_308_a_6_ii_apigateway_stage_logging_enabled,
    control.hipaa_164_308_a_6_ii_cloudtrail_integrated_with_logs,
    control.hipaa_164_308_a_6_ii_cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.hipaa_164_308_a_6_ii_elb_application_classic_logging_enabled,
    control.hipaa_164_308_a_6_ii_guardduty_enabled,
    control.hipaa_164_308_a_6_ii_s3_bucket_logging_enabled,
    control.hipaa_164_308_a_6_ii_securityhub_enabled,
    control.hipaa_164_308_a_6_ii_vpc_flow_log_enabled
  ]
  tags          = local.hipaa_164_308_a_6_ii_common_tags
}

control "hipaa_164_308_a_6_ii_apigateway_stage_logging_enabled" {
  title       = "API gateway stage logging should be enabled"
  description = "API Gateway logging displays detailed views of users who accessed the API and the way they accessed the API."
  sql         = query.apigateway_stage_logging_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_ii_common_tags, {
    service = "apigateway"
  })
}

control "hipaa_164_308_a_6_ii_cloudtrail_integrated_with_logs" {
  title       = "Cloudtrail should be integrated with logs"
  description = "Use Amazon CloudWatch to centrally collect and manage log event activity. Inclusion of AWS CloudTrail data provides details of API call activity within your AWS account."
  sql         = query.cloudtrail_integrated_with_logs.sql

  tags = merge(local.hipaa_164_308_a_6_ii_common_tags, {
    service = "cloudtrail"
  })
}

control "hipaa_164_308_a_6_ii_elb_application_classic_logging_enabled" {
  title       = "ELB logging should be enabled"
  description = "Elastic Load Balancing activity is a central point of communication within an environment. Ensure ELB logging is enabled. The collected data provides detailed information about requests sent to the ELB."
  sql         = query.elb_application_classic_logging_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_ii_common_tags, {
    service = "elb"
  })
}

control "hipaa_164_308_a_6_ii_guardduty_enabled" {
  title       = "Guardduty should be enabled"
  description = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql         = query.guardduty_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_ii_common_tags, {
    service = "guardduty"
  })
}

control "hipaa_164_308_a_6_ii_cloudtrail_multi_region_trail_enabled" {
  title       = "At least one multi-region AWS CloudTrail should be present in an account"
  description = "AWS CloudTrail records AWS Management Console actions and API calls. You can identify which users and accounts called AWS, the source IP address from where the calls were made, and when the calls occurred. CloudTrail will deliver log files from all AWS Regions to your S3 bucket if MULTI_REGION_CLOUD_TRAIL_ENABLED is enabled."
  sql         = query.cloudtrail_multi_region_trail_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_ii_common_tags, {
    service = "cloudtrail"
  })
}

control "hipaa_164_308_a_6_ii_s3_bucket_logging_enabled" {
  title       = "S3 bucket logging should be enabled"
  description = "Amazon Simple Storage Service (Amazon S3) server access logging provides a method to monitor the network for potential cybersecurity events."
  sql         = query.s3_bucket_logging_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_ii_common_tags, {
    service = "s3"
  })
}

control "hipaa_164_308_a_6_ii_securityhub_enabled" {
  title       = "AWS Security Hub should be enabled for an AWS Account"
  description = "AWS Security Hub helps to monitor unauthorized personnel, connections, devices, and software. AWS Security Hub aggregates, organizes, and prioritizes the security alerts, or findings, from multiple AWS services."
  sql         = query.securityhub_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_ii_common_tags, {
    service = "securityhub"
  })
}

control "hipaa_164_308_a_6_ii_vpc_flow_log_enabled" {
  title       = "VPC flow log should be enabled"
  description = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC."
  sql         = query.vpc_flow_log_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_ii_common_tags, {
    service = "vpc"
  })
}

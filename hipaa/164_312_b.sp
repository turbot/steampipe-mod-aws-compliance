locals {
  hipaa_164_312_b_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_b"
  })
}

benchmark "hipaa_164_312_b" {
  title       = "164.312(b) Audit controls"
  description = "Implement hardware, software, and/or procedural mechanisms that record and examine activity in information systems that contain or use electronic protected health information."
  children = [
    control.hipaa_164_312_b_apigateway_stage_logging_enabled,
    control.hipaa_164_312_b_cloudtrail_cloudwatch_logs_enabled,
    control.hipaa_164_312_b_cloudtrail_multi_region_trail_enabled,
    control.hipaa_164_312_b_cloudtrail_s3_data_events_enabled,
    control.hipaa_164_312_b_elb_logging_enabled,
    control.hipaa_164_312_b_guardduty_enabled,
    control.hipaa_164_312_b_redshift_cluster_encryption_logging_enabled,
    control.hipaa_164_312_b_s3_bucket_logging_enabled,
    control.hipaa_164_312_b_securityhub_enabled,
    control.hipaa_164_312_b_vpc_flow_log_enabled
  ]
  tags = local.hipaa_164_312_b_common_tags
}

control "hipaa_164_312_b_apigateway_stage_logging_enabled" {
  title       = "Logging should be enabled for API Gateway stage"
  description = "API Gateway logging displays detailed views of users who accessed the API and the way they accessed the API."
  sql         = query.apigateway_stage_logging_enabled.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "apigateway"
  })
}

control "hipaa_164_312_b_cloudtrail_cloudwatch_logs_enabled" {
  title       = "CloudTrail trails should be integrated with CloudWatch Logs"
  description = "Use Amazon CloudWatch to centrally collect and manage log event activity."
  sql         = query.cloudtrail_integrated_with_logs.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "cloudtrail"
  })
}

control "hipaa_164_312_b_cloudtrail_s3_data_events_enabled" {
  title       = "CloudTrail trail should exist for logging Amazon S3 data events for all S3 buckets"
  description = "The collection of Simple Storage Service (Amazon S3) data events helps in detecting any anomalous activity."
  sql         = query.cloudtrail_s3_data_events_enabled.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "cloudtrail"
  })
}

control "hipaa_164_312_b_elb_logging_enabled" {
  title       = "Application Load Balancer and Classic Load Balancer should have logging enabled"
  description = "Elastic Load Balancing activity is a central point of communication within an environment. Ensure ELB logging is enabled."
  sql         = query.elb_application_classic_logging_enabled.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "elb"
  })
}

control "hipaa_164_312_b_guardduty_enabled" {
  title       = "GuardDuty should be enabled in your AWS account and region"
  description = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql         = query.guardduty_enabled.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "guardduty"
  })
}

control "hipaa_164_312_b_cloudtrail_multi_region_trail_enabled" {
  title       = "At least one multi-region AWS CloudTrail should be present in an account"
  description = "AWS CloudTrail records AWS Management Console actions and API calls. You can identify which users and accounts called AWS, the source IP address from where the calls were made, and when the calls occurred. CloudTrail will deliver log files from all AWS Regions to your S3 bucket if MULTI_REGION_CLOUD_TRAIL_ENABLED is enabled."
  sql         = query.cloudtrail_multi_region_trail_enabled.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "cloudtrail"
  })
}

control "hipaa_164_312_b_redshift_cluster_encryption_logging_enabled" {
  title       = "Audit logging and encryption should be enabled for Redshift cluster"
  description = "To protect data at rest, ensure that encryption is enabled for your Amazon Redshift clusters. You must also ensure that required configurations are deployed on Amazon Redshift clusters. The audit logging should be enabled to provide information about connections and user activities in the database."
  sql         = query.redshift_cluster_encryption_logging_enabled.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "redshift"
  })
}

control "hipaa_164_312_b_s3_bucket_logging_enabled" {
  title       = "Logging should be enabled for all S3 buckets"
  description = "Amazon Simple Storage Service (Amazon S3) server access logging provides a method to monitor the network for potential cybersecurity events."
  sql         = query.s3_bucket_logging_enabled.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "s3"
  })
}

control "hipaa_164_312_b_securityhub_enabled" {
  title       = "AWS Security Hub should be enabled for an AWS Account"
  description = "AWS Security Hub helps to monitor unauthorized personnel, connections, devices, and software. AWS Security Hub aggregates, organizes, and prioritizes the security alerts, or findings, from multiple AWS services."
  sql         = query.securityhub_enabled.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "securityhub"
  })
}

control "hipaa_164_312_b_vpc_flow_log_enabled" {
  title       = "Flow logs should be enabled for all VPCs"
  description = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.vpc_flow_log_enabled.sql

  tags = merge(local.hipaa_164_312_b_common_tags, {
    service = "vpc"
  })
}
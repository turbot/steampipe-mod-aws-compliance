locals {
  hipaa_164_308_a_1_ii_D_common_tags = merge(local.hipaa_common_tags, {
    hipaa_control_id = "hipaa_164_308_a_1_ii_D"
  })
}

benchmark "hipaa_164_308_a_1_ii_D" {
  title         = "164.308(a)(1)(ii)(D)"
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D.md")
  children = [
    control.hipaa_164_308_a_1_ii_D_apigateway_stage_logging_enabled,
    control.hipaa_164_308_a_1_ii_D_cloudtrail_cloudwatch_logs_enabled,
    control.hipaa_164_308_a_1_ii_D_cloudtrail_s3_data_events_enabled,
    control.hipaa_164_308_a_1_ii_D_elb_logging_enabled,
    control.hipaa_164_308_a_1_ii_D_guardduty_enabled,
    control.hipaa_164_308_a_1_ii_D_redshift_cluster_encryption_logging_enabled,
    control.hipaa_164_308_a_1_ii_D_s3_bucket_logging_enabled,
    control.hipaa_164_308_a_1_ii_D_vpc_flow_log_enabled
  ]
  tags = local.hipaa_164_308_a_1_ii_D_common_tags
}

control "hipaa_164_308_a_1_ii_D_apigateway_stage_logging_enabled" {
  title         = "Logging should be enabled for API Gateway stage"
  description   = "API Gateway logging displays detailed views of users who accessed the API and the way they accessed the API."
  sql           = query.apigateway_stage_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_apigateway_stage_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_apigateway_stage_logging_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_cloudtrail_cloudwatch_logs_enabled" {
  title         = "CloudTrail trails should be integrated with CloudWatch Logs"
  description   = "Use Amazon CloudWatch to centrally collect and manage log event activity."
  sql           = query.cloudtrail_integrated_with_logs.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_cloudtrail_cloudwatch_logs_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_cloudtrail_cloudwatch_logs_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_cloudtrail_s3_data_events_enabled" {
  title         = "CloudTrail trail should exist for logging Amazon S3 data events for all S3 buckets"
  description   = "The collection of Simple Storage Service (Amazon S3) data events helps in detecting any anomalous activity."
  sql           = query.cloudtrail_s3_data_events_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_cloudtrail_s3_data_events_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_cloudtrail_s3_data_events_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_elb_logging_enabled" {
  title         = "Application Load Balancer and Classic Load Balancer should have logging enabled"
  description   = "Elastic Load Balancing activity is a central point of communication within an environment. Ensure ELB logging is enabled."
  sql           = query.elb_application_classic_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_elb_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_elb_logging_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_guardduty_enabled" {
  title         = "GuardDuty should be enabled in your AWS account and region"
  description   = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql           = query.guardduty_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_guardduty_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_guardduty_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_redshift_cluster_encryption_logging_enabled" {
  title         = "Audit logging and encryption should be enabled for Redshift cluster"
  description   = "To protect data at rest, ensure that encryption is enabled for your Amazon Redshift clusters. You must also ensure that required configurations are deployed on Amazon Redshift clusters. The audit logging should be enabled to provide information about connections and user activities in the database."
  sql           = query.redshift_cluster_encryption_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_redshift_cluster_encryption_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_redshift_cluster_encryption_logging_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_s3_bucket_logging_enabled" {
  title         = "Logging should be enabled for all S3 buckets"
  description   = "Amazon Simple Storage Service (Amazon S3) server access logging provides a method to monitor the network for potential cybersecurity events."
  sql           = query.s3_bucket_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_s3_bucket_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_s3_bucket_logging_enabled"
  })
}

control "hipaa_164_308_a_1_ii_D_vpc_flow_log_enabled" {
  title         = "Flow logs should be enabled for all VPCs"
  description   = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC)."
  sql           = query.vpc_flow_log_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_D_vpc_flow_log_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_D_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_1_ii_D_vpc_flow_log_enabled"
  })
}
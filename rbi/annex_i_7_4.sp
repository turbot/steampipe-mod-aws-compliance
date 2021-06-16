locals {
  rbi_annex_i_7_4_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_7_4"
  })
}

benchmark "rbi_annex_i_7_4" {
  title       = "Annex_I(7.4)"
  description = "TODO"
  children = [
    control.rbi_annex_i_7_4_apigateway_stage_logging_enabled,
    control.rbi_annex_i_7_4_cloudtrail_integrated_with_logs,
    control.rbi_annex_i_7_4_cloudtrail_multi_region_trail_enabled,
    control.rbi_annex_i_7_4_cloudtrail_s3_data_events_enabled,
    control.rbi_annex_i_7_4_cloudwatch_log_group_retention_period_365,
    control.rbi_annex_i_7_4_elb_application_classic_logging_enabled,
    control.rbi_annex_i_7_4_rds_db_instance_logging_enabled,
    control.rbi_annex_i_7_4_redshift_cluster_encryption_logging_enabled,
    control.rbi_annex_i_7_4_s3_bucket_logging_enabled,
    control.rbi_annex_i_7_4_vpc_flow_log_enabled
  ]
  tags = local.rbi_annex_i_7_4_common_tags
}

control "rbi_annex_i_7_4_apigateway_stage_logging_enabled" {
  title       = "Logging should be enabled for API Gateway stage"
  description = "API Gateway logging displays detailed views of users who accessed the API and the way they accessed the API."
  sql         = query.apigateway_stage_logging_enabled.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "apigateway"
  })
}

control "rbi_annex_i_7_4_cloudtrail_integrated_with_logs" {
  title       = "CloudTrail should be integrated with logs"
  description = "Use Amazon CloudWatch to centrally collect and manage log event activity. Inclusion of AWS CloudTrail data provides details of API call activity within your AWS account."
  sql         = query.cloudtrail_integrated_with_logs.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "cloudtrail"
  })
}

control "rbi_annex_i_7_4_cloudtrail_s3_data_events_enabled" {
  title       = "CloudTrail trail should exist for logging Amazon S3 data events for all S3 buckets"
  description = "The collection of Simple Storage Service (Amazon S3) data events helps in detecting any anomalous activity."
  sql         = query.cloudtrail_s3_data_events_enabled.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "cloudtrail"
  })
}

control "rbi_annex_i_7_4_cloudwatch_log_group_retention_period_365" {
  title       = "Amazon CloudWatch LogGroup retention period should be set"
  description = "Ensure a minimum duration of event log data is retained for your log groups to help with troubleshooting and forensics investigations."
  sql         = query.cloudwatch_log_group_retention_period_365.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "cloudwatch"
  })
}

control "rbi_annex_i_7_4_elb_application_classic_logging_enabled" {
  title       = "ELB application classic LB logging should be enabled"
  description = "Elastic Load Balancing activity is a central point of communication within an environment."
  sql         = query.elb_application_classic_logging_enabled.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "elb"
  })
}

control "rbi_annex_i_7_4_cloudtrail_multi_region_trail_enabled" {
  title       = "At least one multi-region AWS CloudTrail should be present in an account"
  description = "AWS CloudTrail records AWS Management Console actions and API calls. You can identify which users and accounts called AWS, the source IP address from where the calls were made, and when the calls occurred. CloudTrail will deliver log files from all AWS Regions to your S3 bucket if MULTI_REGION_CLOUD_TRAIL_ENABLED is enabled."
  sql         = query.cloudtrail_multi_region_trail_enabled.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "cloudtrail"
  })
}

control "rbi_annex_i_7_4_rds_db_instance_logging_enabled" {
  title       = "Database logging should be enabled"
  description = "To help with logging and monitoring within your environment, ensure Amazon Relational Database Service (Amazon RDS) logging is enabled."
  sql         = query.rds_db_instance_logging_enabled.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "rds"
  })
}

control "rbi_annex_i_7_4_s3_bucket_logging_enabled" {
  title       = "Logging should be enabled for all S3 buckets"
  description = "Amazon Simple Storage Service (Amazon S3) server access logging provides a method to monitor the network for potential cybersecurity events."
  sql         = query.s3_bucket_logging_enabled.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "s3"
  })
}

control "rbi_annex_i_7_4_vpc_flow_log_enabled" {
  title       = "VPC flow log should be enabled"
  description = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.vpc_flow_log_enabled.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "vpc"
  })
}

control "rbi_annex_i_7_4_redshift_cluster_encryption_logging_enabled" {
  title       = "Audit logging and encryption should be enabled for Redshift cluster"
  description = "To protect data at rest, ensure that encryption is enabled for your Amazon Redshift clusters. You must also ensure that required configurations are deployed on Amazon Redshift clusters. The audit logging should be enabled to provide information about connections and user activities in the database."
  sql         = query.redshift_cluster_encryption_logging_enabled.sql

  tags = merge(local.rbi_annex_i_7_4_common_tags, {
    service = "redshift"
  })
}
locals {
  conformance_pack_cloudtrail_common_tags = {
    service = "cloudtrail"
  }
}

control "cloudtrail_integrated_with_logs" {
  title       = "CloudTrail should be integrated with logs"
  description = "Use Amazon CloudWatch to centrally collect and manage log event activity. Inclusion of AWS CloudTrail data provides details of API call activity within your AWS account."
  sql         = query.cloudtrail_integrated_with_logs.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}

control "cloudtrail_s3_data_events_enabled" {
  title       = "CloudTrail trail should exist for logging Amazon S3 data events for all S3 buckets"
  description = "The collection of Simple Storage Service (Amazon S3) data events helps in detecting any anomalous activity."
  sql         = query.cloudtrail_s3_data_events_enabled.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}

control "cloudtrail_logs_encrypted_with_kms_cmk" {
  title       = "CloudTrail logs should be encrypted with KMS CMK"
  description = "To help protect sensitive data at rest, ensure encryption is enabled for your Amazon CloudWatch Log Groups."
  sql         = query.cloudtrail_logs_encrypted_with_kms_cmk.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}

control "cloudtrail_multi_region_trail_enabled" {
  title       = "At least one multi-region AWS CloudTrail should be present in an account"
  description = "AWS CloudTrail records AWS Management Console actions and API calls. You can identify which users and accounts called AWS, the source IP address from where the calls were made, and when the calls occurred. CloudTrail will deliver log files from all AWS Regions to your S3 bucket if MULTI_REGION_CLOUD_TRAIL_ENABLED is enabled."
  sql         = query.cloudtrail_multi_region_trail_enabled.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}

control "cloudtrail_validation_enabled" {
  title       = "CloudTrail log file validation should be enabled"
  description = "Utilize AWS CloudTrail log file validation to check the integrity of CloudTrail logs."
  sql         = query.cloudtrail_validation_enabled.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}
locals {
  conformance_pack_cloudtrail_common_tags = {
    service = "cloudtrail"
  }
}

control "cloudtrail_s3_data_events_enabled" {
  title       = "CloudTrail trail should exist for logging Amazon S3 data events for all S3 buckets"
  description = "The collection of Simple Storage Service (Amazon S3) data events helps in detecting any anomalous activity."
  sql         = query.cloudtrail_s3_data_events_enabled.sql

  tags = local.conformance_pack_cloudtrail_common_tags
}

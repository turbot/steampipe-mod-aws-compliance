locals {
  conformance_pack_glue_common_tags = {
    service = "AWS/Glue"
  }
}

control "glue_dev_endpoint_cloudwatch_logs_encryption_enabled" {
  title       = "Glue dev endpoints cloudWatch logs encryption should be enabled"
  description = "Ensure if glue dev endpoint cloudWatch logs encryption is enabled to protect sensitive information at rest."
  sql         = query.glue_dev_endpoint_cloudwatch_logs_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    extra_checks = "true"
  })
}

control "glue_dev_endpoint_job_bookmarks_encryption_enabled" {
  title       = "Glue dev endpoint job bookmarks encryption should be enabled"
  description = "Ensure if glue dev endpoint job bookmrks encryption is enabled to protect sensitive information at rest."
  sql         = query.glue_dev_endpoint_job_bookmarks_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    extra_checks = "true"
  })
}

control "glue_dev_endpoint_s3_encryption_enabled" {
  title       = "Glue dev endpoints S3 encryption should be enabled"
  description = "Ensure if glue dev endpoint S3 encryption is enabled to protect sensitive information at rest."
  sql         = query.glue_dev_endpoint_s3_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    extra_checks = "true"
  })
}

control "glue_job_cloudwatch_logs_encryption_enabled" {
  title       = "Glue jobs CloudWatch logs encryption should be enabled"
  description = "Ensure if glue job cloudWatch logs encryption is enabled to protect sensitive information at rest."
  sql         = query.glue_job_cloudwatch_logs_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    extra_checks = "true"
  })
}

control "glue_job_bookmarks_encryption_enabled" {
  title       = "Glue jobs bookmarks encryption should be enabled"
  description = "Ensure if glue job bookmarks encryption is enabled to protect sensitive information at rest."
  sql         = query.glue_job_bookmarks_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    extra_checks = "true"
  })
}

control "glue_job_s3_encryption_enabled" {
  title       = "Glue jobs S3 encryption should be enabled"
  description = "Ensure if glue job S3 encryption is enabled to protect sensitive information at rest."
  sql         = query.glue_job_s3_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    extra_checks = "true"
  })
}



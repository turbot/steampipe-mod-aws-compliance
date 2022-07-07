locals {
  conformance_pack_glue_common_tags = {
    service = "AWS/Glue"
  }
}

control "glue_dev_endpoint_cloudwatch_logs_encryption_enabled" {
  title       = "Glue dev endpoints CloudWatch logs encryption should be enabled"
  description = "Ensure Glue dev endpoints have CloudWatch logs encryption enabled to protect sensitive information at rest."
  sql         = query.glue_dev_endpoint_cloudwatch_logs_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    other_checks = "true"
  })
}

control "glue_dev_endpoint_job_bookmarks_encryption_enabled" {
  title       = "Glue dev endpoints job bookmark encryption should be enabled"
  description = "Ensure Glue dev endpoints have job bookmark encryption enabled to protect sensitive information at rest."
  sql         = query.glue_dev_endpoint_job_bookmark_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    other_checks = "true"
  })
}

control "glue_dev_endpoint_s3_encryption_enabled" {
  title       = "Glue dev endpoints S3 encryption should be enabled"
  description = "Ensure Glue dev endpoints have S3 encryption enabled to protect sensitive information at rest."
  sql         = query.glue_dev_endpoint_s3_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    other_checks = "true"
  })
}

control "glue_job_cloudwatch_logs_encryption_enabled" {
  title       = "Glue jobs CloudWatch logs encryption should be enabled"
  description = "Ensure Glue jobs have CloudWatch logs encryption enabled to protect sensitive information at rest."
  sql         = query.glue_job_cloudwatch_logs_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    other_checks = "true"
  })
}

control "glue_job_bookmarks_encryption_enabled" {
  title       = "Glue jobs bookmarks encryption should be enabled"
  description = "Ensure Glue job bookmarks have encryption enabled to protect sensitive information at rest."
  sql         = query.glue_job_bookmarks_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    other_checks = "true"
  })
}

control "glue_job_s3_encryption_enabled" {
  title       = "Glue jobs S3 encryption should be enabled"
  description = "Ensure Glue jobs have S3 encryption enabled to protect sensitive information at rest."
  sql         = query.glue_job_s3_encryption_enabled.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    other_checks = "true"
  })
}

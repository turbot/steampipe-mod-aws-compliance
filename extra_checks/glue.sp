locals {
  extra_checks_glue_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_glue" {
  title       = "Glue"
  description = "This benchmark contains additional checks for AWS Glue servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.glue_dev_endpoint_cloudwatch_logs_encryption_enabled,
    control.glue_dev_endpoint_job_bookmarks_encryption_enabled,
    control.glue_dev_endpoint_s3_encryption_enabled,
    control.glue_job_cloudwatch_logs_encryption_enabled,
    control.glue_job_bookmarks_encryption_enabled,
    control.glue_job_s3_encryption_enabled
  ]

  tags = local.extra_checks_glue_common_tags
}

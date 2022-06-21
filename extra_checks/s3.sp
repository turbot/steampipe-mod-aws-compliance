locals {
  extra_checks_s3_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_s3" {
  title       = "S3 Extra Checks"
  description = "TODO"
  children = [
    control.s3_bucket_object_logging_enabled
  ]

  tags = local.extra_checks_s3_common_tags
}



locals {
  extra_checks_s3_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_s3" {
  title       = "S3"
  description = "This benchmark contains additional checks for AWS s3 servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.s3_bucket_object_logging_enabled
  ]

  tags = local.extra_checks_s3_common_tags
}



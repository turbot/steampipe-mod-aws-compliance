locals {
  extra_checks_cloudfront_common_tags = merge(local.extra_checks_common_tags, {
     type = "Benchmark"
  })
}

benchmark "extra_checks_cloudfront" {
  title       = "CloudFront"
  description = "This benchmark contains additional checks for AWS CloudFront servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.cloudfront_distribution_geo_restrictions_enabled
  ]

  tags = local.extra_checks_cloudfront_common_tags
}

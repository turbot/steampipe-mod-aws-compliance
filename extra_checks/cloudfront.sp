locals {
  extra_checks_cloudfront_common_tags = merge(local.extra_checks_common_tags, {
     type = "Benchmark"
  })
}

benchmark "extra_checks_cloudfront" {
  title       = "CloudFront Extra Checks"
  description = "TODO"
  children = [
    control.cloudfront_distribution_geo_restrictions_enabled
  ]

  tags = local.extra_checks_cloudfront_common_tags
}

locals {
  extra_checks_cloudfront_common_tags = merge(local.extra_checks_common_tags, {
    service = "cloudfront"
  })
}

benchmark "group_cloudfront" {
  title       = "CloudFront Checks"
  description = "This group of cloudfront extra checks shows results of controls related to cloudfront service."
  children = [
    control.cloudfront_distribution_geo_restriction_enabled
  ]

  tags = local.extra_checks_cloudfront_common_tags
}

control "cloudfront_distribution_geo_restriction_enabled" {
  title       = "Check if Geo restrictions are enabled in CloudFront distributions"
  description = "Geo restrictions are used to prevent users in specific geographic locations from accessing content that you're distributing through a CloudFront distribution."
  sql         = query.cloudfront_distribution_geo_restriction_enabled.sql

  tags = merge(local.extra_checks_cloudfront_common_tags, {
    extra_check_category = "infrastructure_security"
  })
}

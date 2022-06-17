locals {
  conformance_pack_cloudfront_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudFront"
  })
}

control "cloudfront_distribution_encryption_in_transit_enabled" {
  title       = "CloudFront distributions should require encryption in transit"
  description = "This control checks whether an Amazon CloudFront distribution requires viewers to use HTTPS directly or whether it uses redirection. The control fails if ViewerProtocolPolicy is set to allow-all for defaultCacheBehavior or for cacheBehaviors."
  sql         = query.cloudfront_distribution_encryption_in_transit_enabled.sql

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    gdpr = "true"
    hipaa = "true"
  })
}

control "cloudfront_distribution_geo_restrictions_enabled" {
  title       = "CloudFront distributions geo restrictions should be enabled"
  description = "TO DO"
  sql         = query.cloudfront_distribution_geo_restrictions_enabled.sql

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    extra_checks = "true"
  })
}

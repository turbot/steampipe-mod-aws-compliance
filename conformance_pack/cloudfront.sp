locals {
  conformance_pack_cloudfront_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudFront"
  })
}

control "cloudfront_distribution_encryption_in_transit_enabled" {
  title       = "CloudFront distributions should require encryption in transit"
  description = "This control checks whether an Amazon CloudFront distribution requires viewers to use HTTPS directly or whether it uses redirection. The control fails if ViewerProtocolPolicy is set to allow-all for defaultCacheBehavior or for cacheBehaviors."
  query       = query.cloudfront_distribution_encryption_in_transit_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    gdpr  = "true"
    hipaa = "true"
  })
}

control "cloudfront_distribution_geo_restrictions_enabled" {
  title       = "CloudFront distributions should have geo restriction enabled"
  description = "Geographic restriction is used to restrict access to all of the files that are associated with a distribution at the country level."
  query       = query.cloudfront_distribution_geo_restrictions_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    other_checks = "true"
  })
}

control "cloudfront_distribution_use_secure_cipher" {
  title       = "CloudFront distributions should use secure SSL cipher"
  description = "Ensure that CloudFront distributions do not have any insecure SSL ciphers. Using insecure and deprecated ciphers could make the SSL connection between the CloudFront and the origins vulnerable to exploits."
  query       = query.cloudfront_distribution_use_secure_cipher

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    other_checks = "true"
  })
}

control "cloudfront_distribution_non_s3_origins_encryption_in_transit_enabled" {
  title       = "CloudFront distributions should encrypt traffic to non S3 origins"
  description = "This control ensures that conection between cloudfront and oriign server is encrypted. It is recommended to enforce HTTPS-only traffic between a CloudFront distribution and the origin."
  query       = query.cloudfront_distribution_non_s3_origins_encryption_in_transit_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    other_checks = "true"
  })
}

control "cloudfront_distribution_logging_enabled" {
  title       = "CloudFront distributions access logs should be enabled"
  description = "This control checks if Amazon CloudFront distributions are configured to capture information from Amazon Simple Storage Service (Amazon S3) server access logs. This rule is non compliant if a CloudFront distribution does not have logging configured."
  query       = query.cloudfront_distribution_logging_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    cis_controls_v8_ig1 = "true"
  })
}

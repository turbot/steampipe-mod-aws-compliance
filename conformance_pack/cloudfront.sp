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
    audit_manager_pci_v321 = "true"
    gdpr                   = "true"
    hipaa                  = "true"
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
  title       = "CloudFront distribution should use secure SSL cipher"
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

control "cloudfront_distribution_no_deprecated_ssl_protocol" {
  title       = "CloudFront distributions should not use deprecated SSL protocols between edge locations and custom origins"
  description = "This control checks if Amazon CloudFront distributions are using deprecated SSL protocols for HTTPS communication between CloudFront edge locations and your custom origins. This control fails if a CloudFront distribution has a CustomOriginConfig where OriginSslProtocols includes SSLv3."
  query       = query.cloudfront_distribution_no_deprecated_ssl_protocol
  
  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}
control "cloudfront_distribution_custom_origins_encryption_in_transit_enabled" {
  title         = "CloudFront distributions should encrypt traffic to custom origins"
  description   = "This control checks if Amazon CloudFront distributions are encrypting traffic to custom origins. This control fails for a CloudFront distribution whose origin protocol policy allows 'http-only'. This control also fails if the distribution's origin protocol policy is 'match-viewer' while the viewer protocol policy is 'allow-all'."
  query         = query.cloudfront_distribution_custom_origins_encryption_in_transit_enabled

  tags = merge(local.conformance_pack_cloudfront_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

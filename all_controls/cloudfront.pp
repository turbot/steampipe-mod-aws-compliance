locals {
  all_controls_cloudfront_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/CloudFront"
  })
}

benchmark "all_controls_cloudfront" {
  title       = "CloudFront"
  description = "This section contains recommendations for configuring CloudFront resources."
  children = [
    control.cloudfront_distribution_configured_with_origin_failover,
    control.cloudfront_distribution_custom_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_default_root_object_configured,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudfront_distribution_field_level_encryption_enabled,
    control.cloudfront_distribution_geo_restrictions_enabled,
    control.cloudfront_distribution_latest_tls_version,
    control.cloudfront_distribution_logging_enabled,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.cloudfront_distribution_no_non_existent_s3_origin,
    control.cloudfront_distribution_non_s3_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_origin_access_identity_enabled,
    control.cloudfront_distribution_sni_enabled,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.cloudfront_distribution_use_secure_cipher,
    control.cloudfront_distribution_uses_recommended_tls_security_policy,
    control.cloudfront_distribution_waf_enabled
  ]

  tags = merge(local.all_controls_cloudfront_common_tags, {
    type = "Benchmark"
  })
}

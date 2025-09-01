locals {
  foundational_security_cloudfront_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/CloudFront"
  })
}

benchmark "foundational_security_cloudfront" {
  title         = "CloudFront"
  documentation = file("./foundational_security/docs/foundational_security_cloudfront.md")
  children = [
    control.foundational_security_cloudfront_1,
    control.foundational_security_cloudfront_3,
    control.foundational_security_cloudfront_4,
    control.foundational_security_cloudfront_5,
    control.foundational_security_cloudfront_6,
    control.foundational_security_cloudfront_7,
    control.foundational_security_cloudfront_8,
    control.foundational_security_cloudfront_9,
    control.foundational_security_cloudfront_10,
    control.foundational_security_cloudfront_12,
    control.foundational_security_cloudfront_13,
    control.foundational_security_cloudfront_15
  ]

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_cloudfront_1" {
  title         = "1 CloudFront distributions should have a default root object configured"
  description   = "This control checks whether an Amazon CloudFront distribution is configured to return a specific object that is the default root object. The control fails if the CloudFront distribution does not have a default root object configured."
  severity      = "critical"
  query         = query.cloudfront_distribution_default_root_object_configured
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_1.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_1"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_cloudfront_3" {
  title         = "3 CloudFront distributions should require encryption in transit"
  description   = "This control checks whether an Amazon CloudFront distribution requires viewers to use HTTPS directly or whether it uses redirection. The control fails if ViewerProtocolPolicy is set to allow-all for defaultCacheBehavior or for cacheBehaviors."
  severity      = "medium"
  query         = query.cloudfront_distribution_encryption_in_transit_enabled
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_3.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_3"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_cloudfront_4" {
  title         = "4 CloudFront distributions should have origin failover configured"
  description   = "This control checks whether an Amazon CloudFront distribution is configured with an origin group that has two or more origins. CloudFront origin failover can increase availability. Origin failover automatically redirects traffic to a secondary origin if the primary origin is unavailable or if it returns specific HTTP response status codes."
  severity      = "low"
  query         = query.cloudfront_distribution_configured_with_origin_failover
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_4.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_4"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_cloudfront_5" {
  title         = "5 CloudFront distributions should have logging enabled"
  description   = "This control checks whether server access logging is enabled on CloudFront distributions. The control fails if access logging is not enabled for a distribution."
  severity      = "medium"
  query         = query.cloudfront_distribution_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_5.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_5"
    foundational_security_category = "logging"
  })
}

control "foundational_security_cloudfront_6" {
  title         = "6 CloudFront distributions should have AWS WAF enabled"
  description   = "This control checks whether CloudFront distributions are associated with either AWS WAF or AWS WAFv2 web ACLs. The control fails if the distribution is not associated with a web ACL."
  severity      = "medium"
  query         = query.cloudfront_distribution_waf_enabled
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_6.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_6"
    foundational_security_category = "protective_services"
  })
}

control "foundational_security_cloudfront_7" {
  title         = "7 CloudFront distributions should use custom SSL/TLS certificates"
  description   = "This control checks whether CloudFront distributions are using the default SSL/TLS certificate CloudFront provides. This control passes if the CloudFront distribution uses a custom SSL/TLS certificate. This control fails if the CloudFront distribution uses the default SSL/TLS certificate."
  severity      = "medium"
  query         = query.cloudfront_distribution_use_custom_ssl_certificate
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_7.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_7"
    foundational_security_category = "encryption_of_data_in_transi"
  })
}

control "foundational_security_cloudfront_8" {
  title         = "8 CloudFront distributions should use SNI to serve HTTPS requests"
  description   = "This control checks if Amazon CloudFront distributions are using a custom SSL/TLS certificate and are configured to use SNI to serve HTTPS requests. This control fails if a custom SSL/TLS certificate is associated but the SSL/TLS support method is a dedicated IP address."
  severity      = "low"
  query         = query.cloudfront_distribution_sni_enabled
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_8.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_8"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_cloudfront_9" {
  title         = "9 CloudFront distributions should encrypt traffic to custom origins"
  description   = "This control checks if Amazon CloudFront distributions are encrypting traffic to custom origins. This control fails for a CloudFront distribution whose origin protocol policy allows 'http-only'. This control also fails if the distribution's origin protocol policy is 'match-viewer' while the viewer protocol policy is 'allow-all'."
  severity      = "medium"
  query         = query.cloudfront_distribution_custom_origins_encryption_in_transit_enabled
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_9.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_9"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_cloudfront_10" {
  title         = "10 CloudFront distributions should not use deprecated SSL protocols between edge locations and custom origins"
  description   = "This control checks if Amazon CloudFront distributions are using deprecated SSL protocols for HTTPS communication between CloudFront edge locations and your custom origins. This control fails if a CloudFront distribution has a CustomOriginConfig where OriginSslProtocols includes SSLv3."
  severity      = "medium"
  query         = query.cloudfront_distribution_no_deprecated_ssl_protocol
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_10.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_10"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_cloudfront_12" {
  title         = "12 CloudFront distributions should not point to non-existent S3 origins"
  description   = "This control checks whether Amazon CloudFront distributions are pointing to non-existent Amazon S3 origins. The control fails for a CloudFront distribution if the origin is configured to point to a non-existent bucket. This control only applies to CloudFront distributions where an S3 bucket without static website hosting is the S3 origin."
  severity      = "high"
  query         = query.cloudfront_distribution_no_non_existent_s3_origin
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_12.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_12"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_cloudfront_13" {
  title         = "13 CloudFront distributions should use origin access control"
  description   = "This control checks whether an Amazon CloudFront distribution with an Amazon S3 origin has origin access control (OAC) configured. The control fails if OAC isn't configured for the CloudFront distribution."
  severity      = "medium"
  query         = query.cloudfront_distribution_origin_access_identity_enabled
  documentation = file("./foundational_security/docs/foundational_security_cloudfront_13.md")

  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_13"
    foundational_security_category = "resource_policy_configuration"
  })
}

control "foundational_security_cloudfront_15" {
  title       = "15 CloudFront distributions should use the recommended TLS security policy"
  description = "This control checks whether an Amazon CloudFront distribution is configured to use the recommended TLS security policy. The control fails if the CloudFront distribution is not configured to use the recommended TLS security policy."
  severity      = "medium"
  query         = query.cloudfront_distribution_uses_recommended_tls_security_policy
  tags = merge(local.foundational_security_cloudfront_common_tags, {
    foundational_security_item_id  = "cloudfront_15"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}
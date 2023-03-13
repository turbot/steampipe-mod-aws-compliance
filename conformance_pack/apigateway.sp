locals {
  conformance_pack_apigateway_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/APIGateway"
  })
}

control "apigateway_stage_cache_encryption_at_rest_enabled" {
  title       = "API Gateway stage cache encryption at rest should be enabled"
  description = "To help protect data at rest, ensure encryption is enabled for your API Gateway stage's cache."
  query       = query.apigateway_stage_cache_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    gxp_eu_annex_11        = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "apigateway_stage_logging_enabled" {
  title       = "API Gateway stage logging should be enabled"
  description = "API Gateway logging displays detailed views of users who accessed the API and the way they accessed the API."
  query       = query.apigateway_stage_logging_enabled

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cis_controls_v8_ig1    = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "apigateway_rest_api_stage_use_ssl_certificate" {
  title       = "API Gateway stage should uses SSL certificate"
  description = "Ensure if a REST API stage uses a Secure Sockets Layer (SSL) certificate. This rule is compliant if the REST API stage does not have an associated SSL certificate."
  query       = query.apigateway_rest_api_stage_use_ssl_certificate

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "apigateway_stage_use_waf_web_acl" {
  title       = "API Gateway stage should be associated with waf"
  description = "Ensure if an Amazon API Gateway API stage is using a WAF Web ACL. This rule is non compliant if an AWS WAF Web ACL is not used."
  query       = query.apigateway_stage_use_waf_web_acl

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "apigateway_rest_api_authorizers_configured" {
  title       = "API Gateway stages should have authorizers configured"
  description = "Ensure API Gateway stages have authorizers configured."
  query       = query.apigateway_rest_api_authorizers_configured

  tags = merge(local.conformance_pack_apigateway_common_tags, {
    other_checks = "true"
  })
}

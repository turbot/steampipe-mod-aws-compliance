locals {
  foundational_security_apigateway_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/APIGateway"
  })
}

benchmark "foundational_security_apigateway" {
  title         = "API Gateway"
  documentation = file("./foundational_security/docs/foundational_security_apigateway.md")
  children = [
    control.foundational_security_apigateway_1,
    control.foundational_security_apigateway_2,
    control.foundational_security_apigateway_3,
    control.foundational_security_apigateway_4,
    control.foundational_security_apigateway_5,
    control.foundational_security_apigateway_8,
    control.foundational_security_apigateway_9
  ]

  tags = merge(local.foundational_security_apigateway_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_apigateway_1" {
  title         = "1 API Gateway REST and WebSocket API logging should be enabled"
  description   = "This control checks whether all stages of an Amazon API Gateway REST or WebSocket API have logging enabled. The control fails if logging is not enabled for all methods of a stage or if loggingLevel is neither ERROR nor INFO."
  severity      = "medium"
  query         = query.apigateway_stage_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_apigateway_1.md")

  tags = merge(local.foundational_security_apigateway_common_tags, {
    foundational_security_item_id  = "apigateway_1"
    foundational_security_category = "logging"
  })
}

control "foundational_security_apigateway_2" {
  title         = "2 API Gateway REST API stages should be configured to use SSL certificates for backend authentication"
  description   = "This control checks whether Amazon API Gateway REST API stages have SSL certificates configured. Backend systems use these certificates to authenticate that incoming requests are from API Gateway."
  severity      = "medium"
  query         = query.apigateway_rest_api_stage_use_ssl_certificate
  documentation = file("./foundational_security/docs/foundational_security_apigateway_2.md")

  tags = merge(local.foundational_security_apigateway_common_tags, {
    foundational_security_item_id  = "apigateway_2"
    foundational_security_category = "data_protection"
  })
}

control "foundational_security_apigateway_3" {
  title         = "3 API Gateway REST API stages should have AWS X-Ray tracing enabled"
  description   = "This control checks whether AWS X-Ray active tracing is enabled for your Amazon API Gateway REST API stages."
  severity      = "low"
  query         = query.apigateway_rest_api_stage_xray_tracing_enabled
  documentation = file("./foundational_security/docs/foundational_security_apigateway_3.md")

  tags = merge(local.foundational_security_apigateway_common_tags, {
    foundational_security_item_id  = "apigateway_3"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_apigateway_4" {
  title         = "4 API Gateway should be associated with an AWS WAF web ACL"
  description   = "This control checks whether an API Gateway stage uses an AWS WAF web access control list (ACL). This control fails if an AWS WAF web ACL is not attached to a REST API Gateway stage."
  severity      = "medium"
  query         = query.apigateway_stage_use_waf_web_acl
  documentation = file("./foundational_security/docs/foundational_security_apigateway_4.md")

  tags = merge(local.foundational_security_apigateway_common_tags, {
    foundational_security_item_id  = "apigateway_4"
    foundational_security_category = "protective_services"
  })
}

control "foundational_security_apigateway_5" {
  title         = "5 API Gateway REST API cache data should be encrypted at rest"
  description   = "This control checks whether all methods in API Gateway REST API stages that have cache enabled are encrypted. The control fails if any method in an API Gateway REST API stage is configured to cache and the cache is not encrypted."
  severity      = "medium"
  query         = query.apigateway_stage_cache_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_apigateway_5.md")

  tags = merge(local.foundational_security_apigateway_common_tags, {
    foundational_security_item_id  = "apigateway_5"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_apigateway_8" {
  title         = "8 API Gateway routes should specify an authorization type"
  description   = "This control checks if Amazon API Gateway routes have an authorization type. The control fails if the API Gateway route does not specify an authorization type."
  severity      = "medium"
  query         = query.api_gatewayv2_route_authorization_type_configured
  documentation = file("./foundational_security/docs/foundational_security_apigateway_8.md")

  tags = merge(local.foundational_security_apigateway_common_tags, {
    foundational_security_item_id  = "apigateway_8"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_apigateway_9" {
  title         = "9 Access logging should be configured for API Gateway V2 Stages"
  description   = "This control checks if Amazon API Gateway V2 stages have access logging configured. This control fails if access log settings aren't defined."
  severity      = "medium"
  query         = query.gatewayv2_stage_access_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_apigateway_9.md")

  tags = merge(local.foundational_security_apigateway_common_tags, {
    foundational_security_item_id  = "apigateway_9"
    foundational_security_category = "logging"
  })
}

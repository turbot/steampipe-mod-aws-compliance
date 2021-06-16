locals {
  foundational_security_apigateway_common_tags = merge(local.foundational_security_common_tags, {
    service = "apigateway"
  })
}

benchmark "foundational_security_apigateway" {
  title         = "API Gateway"
  documentation = file("./foundational_security/docs/foundational_security_apigateway.md")
  children = [
    control.foundational_security_apigateway_1,
    control.foundational_security_apigateway_2
  ]
  tags          = local.foundational_security_apigateway_common_tags
}

control "foundational_security_apigateway_1" {
  title         = "1 API Gateway REST and WebSocket API logging should be enabled"
  description   = "This control checks whether all stages of an Amazon API Gateway REST or WebSocket API have logging enabled. The control fails if logging is not enabled for all methods of a stage or if loggingLevel is neither ERROR nor INFO."
  severity      = "medium"
  sql           = query.apigateway_stage_logging_enabled.sql
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
  sql           = query.apigateway_rest_api_stage_use_ssl_certificate.sql
  documentation = file("./foundational_security/docs/foundational_security_apigateway_2.md")

  tags = merge(local.foundational_security_apigateway_common_tags, {
    foundational_security_item_id  = "apigateway_2"
    foundational_security_category = "data_protection"
  })
}
locals {
  all_controls_apigateway_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/APIGateway"
  })
}

benchmark "all_controls_apigateway" {
  title       = "API Gateway"
  description = "This section contains recommendations for configuring API Gateway resources."
  children = [
    control.api_gateway_method_authorization_type_configured,
    control.api_gateway_method_request_parameter_validated,
    control.api_gateway_rest_api_public_endpoint_with_authorizer,
    control.api_gatewayv2_route_authorization_type_configured,
    control.api_gatewayv2_route_authorizer_configured,
    control.apigateway_rest_api_authorizers_configured,
    control.apigateway_rest_api_endpoint_restrict_public_access,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.apigateway_stage_logging_enabled,
    control.apigateway_stage_use_waf_web_acl,
    control.gatewayv2_stage_access_logging_enabled
  ]

  tags = merge(local.all_controls_apigateway_common_tags, {
    type = "Benchmark"
  })
}

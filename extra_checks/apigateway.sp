locals {
  extra_checks_apigateway_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_apigateway" {
  title       = "API Gateway Extra Checks"
  description = "TODO"
  children = [
    control.apigateway_rest_api_authorizers_configured
  ]

  tags = local.extra_checks_apigateway_common_tags
}

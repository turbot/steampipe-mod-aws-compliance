locals {
  extra_checks_apigateway_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_apigateway" {
  title       = "API Gateway"
  description = "This benchmark contains additional checks for AWS API Gateway service, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.apigateway_rest_api_authorizers_configured
  ]

  tags = local.extra_checks_apigateway_common_tags
}

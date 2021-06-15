locals {
  conformance_pack_apigateway_common_tags = {
    service = "apigateway"
  }
}

control "apigateway_stage_cache_encryption_at_rest_enabled" {
  title       = "API Gateway stage cache encryption at rest should be enabled"
  description = "To help protect data at rest, ensure encryption is enabled for your API Gateway stage's cache."
  sql         = query.apigateway_stage_cache_encryption_at_rest_enabled.sql
  tags        = local.conformance_pack_autoscaling_common_tags
}

control "apigateway_stage_logging_enabled" {
  title       = "Logging should be enabled for API Gateway stage"
  description = "API Gateway logging displays detailed views of users who accessed the API and the way they accessed the API."
  sql         = query.apigateway_stage_logging_enabled.sql
  tags        = local.conformance_pack_autoscaling_common_tags
}
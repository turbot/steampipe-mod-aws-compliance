locals {
  all_controls_appsync_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/AppSync"
  })
}

benchmark "all_controls_appsync" {
  title       = "AppSync"
  description = "This section contains recommendations for configuring AppSync resources."
  children = [
    control.appsync_graphql_api_cache_encryption_at_rest_enabled,
    control.appsync_graphql_api_cache_encryption_in_transit_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.appsync_graphql_api_authentication_without_api_key
  ]

  tags = merge(local.all_controls_appsync_common_tags, {
    type = "Benchmark"
  })
}

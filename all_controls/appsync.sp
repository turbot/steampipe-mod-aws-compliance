locals {
  all_controls_appsync_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/AppSync"
  })
}

benchmark "all_controls_appsync" {
  title       = "AppSync"
  description = "This section contains recommendations for configuring AppSync resources."
  children = [
    control.appsync_graphql_api_field_level_logging_enabled
  ]

  tags = merge(local.all_controls_appsync_common_tags, {
    type = "Benchmark"
  })
}



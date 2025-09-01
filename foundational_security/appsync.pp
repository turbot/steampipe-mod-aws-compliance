locals {
  foundational_security_appsync_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/AppSync"
  })
}

benchmark "foundational_security_appsync" {
  title         = "AppSync"
  documentation = file("./foundational_security/docs/foundational_security_appsync.md")
  children = [
    control.foundational_security_appsync_1,
    control.foundational_security_appsync_2,
    control.foundational_security_appsync_5,
    control.foundational_security_appsync_6,
  ]

  tags = merge(local.foundational_security_appsync_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_appsync_1" {
  title         = "1 AWS AppSync API caches should be encrypted at rest"
  description   = "This control checks whether an AWS AppSync API cache is encrypted at rest. The control fails if the API cache isn't encrypted at rest."
  severity      = "medium"
  query         = query.appsync_graphql_api_cache_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_appsync_1.md")

  tags = merge(local.foundational_security_appsync_common_tags, {
    foundational_security_item_id  = "appsync_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_appsync_2" {
  title         = "2 AWS AppSync should have field-level logging enabled"
  description   = "This control checks whether an AWS AppSync API has field-level logging turned on. The control fails if the field resolver log level is set to None. Unless you provide custom parameter values to indicate that a specific log type should be enabled, Security Hub produces a passed finding if the field resolver log level is either ERROR or ALL."
  severity      = "medium"
  query         = query.appsync_graphql_api_field_level_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_appsync_2.md")

  tags = merge(local.foundational_security_appsync_common_tags, {
    foundational_security_item_id  = "appsync_2"
    foundational_security_category = "logging"
  })
}

control "foundational_security_appsync_5" {
  title         = "5 AWS AppSync GraphQL APIs should not be authenticated with API keys"
  description   = "This control checks whether your application uses an API key to interact with an AWS AppSync GraphQL API. The control fails if an AWS AppSync GraphQL API is authenticated with an API key."
  severity      = "high"
  query         = query.appsync_graphql_api_authentication_without_api_key

  documentation = file("./foundational_security/docs/foundational_security_appsync_5.md")

  tags = merge(local.foundational_security_appsync_common_tags, {
    foundational_security_item_id  = "appsync_5"
    foundational_security_category = "passwordless_authentication"
  })
}

control "foundational_security_appsync_6" {
  title         = "6 AWS AppSync API caches should be encrypted in transit"
  description   = "This control checks whether an AWS AppSync API cache is encrypted in transit. The control fails if the API cache isn't encrypted in transit."
  severity      = "medium"
  query         = query.appsync_graphql_api_cache_encryption_in_transit_enabled

  documentation = file("./foundational_security/docs/foundational_security_appsync_6.md")

  tags = merge(local.foundational_security_appsync_common_tags, {
    foundational_security_item_id  = "appsync_6"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

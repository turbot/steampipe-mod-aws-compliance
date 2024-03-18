locals {
  foundational_security_appsync_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/AppSync"
  })
}

benchmark "foundational_security_appsync" {
  title         = "AppSync"
  documentation = file("./foundational_security/docs/foundational_security_appsync.md")
  children = [
    control.foundational_security_appsync_2
  ]

  tags = merge(local.foundational_security_appsync_common_tags, {
    type = "Benchmark"
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

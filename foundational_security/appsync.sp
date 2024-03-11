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
  title         = "1 Security contact information should be provided for an AWS account"
  description   = "This control checks if an Amazon Web Services (AWS) account has security contact information. The control fails if security contact information is not provided for the account."
  severity      = "medium"
  query         = query.appsync_graphql_api_field_level_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_appsync_2.md")

  tags = merge(local.foundational_security_appsync_common_tags, {
    foundational_security_item_id  = "appsync_1"
    foundational_security_category = "logging"
  })
}

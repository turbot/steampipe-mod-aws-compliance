locals {
  foundational_security_cognito_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Cognito"
  })
}

benchmark "foundational_security_cognito" {
  title         = "Cognito"
  documentation = file("./foundational_security/docs/foundational_security_cognito.md")
  children = [
    control.foundational_security_cognito_2
  ]

  tags = merge(local.foundational_security_cognito_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_cognito_2" {
  title         = "2 Cognito identity pools should not allow unauthenticated identities"
  description   = "This control checks whether an Amazon Cognito identity pool is configured to allow unauthenticated identities. The control fails if guest access is activated (the AllowUnauthenticatedIdentities parameter is set to true) for the identity pool."
  severity      = "medium"
  query         = query.cognito_identity_pools_restrict_unauthenticated_identities
  documentation = file("./foundational_security/docs/foundational_security_cognito_2.md")

  tags = merge(local.foundational_security_cognito_common_tags, {
    foundational_security_item_id  = "cognito_2"
    foundational_security_category = "passwordless_authentication"
  })
}
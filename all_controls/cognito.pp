locals {
  all_controls_cognito_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Cognito"
  })
}

benchmark "all_controls_cognito" {
  title       = "Cognito"
  description = "This section contains recommendations for configuring Cognito resources."
  children = [
    control.cognito_identity_pools_restrict_unauthenticated_identities,
    control.cognito_user_pool_password_policy_with_strong_configuration
  ]

  tags = merge(local.all_controls_cognito_common_tags, {
    type = "Benchmark"
  })
}

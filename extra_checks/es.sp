locals {
  extra_checks_es_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_es" {
  title       = "ES Extra Checks"
  description = "TODO"
  children = [
    control.es_domain_cognito_authentication_enabled,
    control.es_domain_internal_user_database_enabled
  ]

  tags = local.extra_checks_es_common_tags
}

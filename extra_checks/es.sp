locals {
  extra_checks_es_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_es" {
  title       = "ES"
  description = "This benchmark contains additional checks for AWS ES servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.es_domain_cognito_authentication_enabled,
    control.es_domain_internal_user_database_enabled
  ]

  tags = local.extra_checks_es_common_tags
}

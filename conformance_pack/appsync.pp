locals {
  conformance_pack_appsync_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/AppSync"
  })
}

control "appsync_graphql_api_field_level_logging_enabled" {
  title       = "AppSync graphql API logging should be enabled"
  description = "This control checks whether an AWS AppSync API has field-level logging turned on. The control fails if the field resolver log level is set to None. Unless you provide custom parameter values to indicate that a specific log type should be enabled, Security Hub produces a passed finding if the field resolver log level is either ERROR or ALL."
  query       = query.appsync_graphql_api_field_level_logging_enabled

  tags = merge(local.conformance_pack_appsync_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "appsync_graphql_api_cache_encryption_in_transit_enabled" {
  title         = "AWS AppSync API caches should be encrypted in transit"
  description   = "This control checks whether an AWS AppSync API cache is encrypted in transit. The control fails if the API cache isn't encrypted in transit."
  query         = query.appsync_graphql_api_cache_encryption_in_transit_enabled

  tags = local.conformance_pack_appsync_common_tags
}

control "appsync_graphql_api_cache_encryption_at_rest_enabled" {
  title         = "AWS AppSync API caches should be encrypted at rest"
  description   = "This control checks whether an AWS AppSync API cache is encrypted at rest. The control fails if the API cache isn't encrypted at rest."
  query         = query.appsync_graphql_api_cache_encryption_at_rest_enabled

  tags = local.conformance_pack_appsync_common_tags
}

control "appsync_graphql_api_authentication_without_api_key" {
  title         = "AWS AppSync GraphQL APIs should not be authenticated with API keys"
  description   = "This control checks whether your application uses an API key to interact with an AWS AppSync GraphQL API. The control fails if an AWS AppSync GraphQL API is authenticated with an API key."
  query         = query.appsync_graphql_api_authentication_without_api_key

  tags = local.conformance_pack_appsync_common_tags
}


query "appsync_graphql_api_field_level_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when log_config ->>  'FieldLogLevel' in ('ERROR', 'ALL') then 'ok'
        else 'alarm'
      end as status,
      case
        when log_config ->>  'FieldLogLevel' in ('ERROR', 'ALL') then title || ' field level logging enabled.'
        else name || ' field level logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_appsync_graphql_api;
  EOQ
}

query "appsync_graphql_api_cache_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (api_cache ->> 'AtRestEncryptionEnabled')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (api_cache ->> 'AtRestEncryptionEnabled')::bool then title || ' encryption at rest enabled.'
        else name || ' encryption at rest disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_appsync_graphql_api;
  EOQ
}

query "appsync_graphql_api_cache_encryption_in_transit_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (api_cache ->> 'TransitEncryptionEnabled')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (api_cache ->> 'TransitEncryptionEnabled')::bool then title || ' encryption in transit enabled.'
        else name || ' encryption in transit disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_appsync_graphql_api;
  EOQ
}

query "appsync_graphql_api_authentication_without_api_key" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when authentication_type = 'API_KEY' then 'alarm'
        else 'ok'
      end as status,
      name || ' uses ' || authentication_type || ' authentication method.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_appsync_graphql_api;
  EOQ
}

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
    pci_dss_v400         = "true"
  })
}

query "appsync_graphql_api_field_level_logging_enabled" {
  sql = <<-EOQ
    select
      name as resource,
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
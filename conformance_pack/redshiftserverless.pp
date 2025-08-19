locals {
  conformance_pack_redshiftserverless_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/RedshiftServerless"
  })
}

control "redshiftserverless_namespace_no_default_admin_username" {
  title         = "Redshift Serverless namespaces should not use the default admin username"
  description   = "This control checks whether the admin username for an Amazon Redshift Serverless namespace is the default admin username, admin. The control fails if the admin username for the Redshift Serverless namespace is admin. You can optionally specify a list of admin usernames for the control to include in the evaluation."
  query         = query.redshiftserverless_namespace_no_default_admin_username

  tags = local.conformance_pack_redshiftserverless_common_tags
}

control "redshiftserverless_namespace_no_default_database_username" {
  title         = "Redshift Serverless namespaces should not use the default database name"
  description   = "This control checks whether an Amazon Redshift Serverless namespace uses the default database name, dev. The control fails if the Redshift Serverless namespace uses the default database name, dev."
  query         = query.redshiftserverless_namespace_no_default_database_username

  tags = local.conformance_pack_redshiftserverless_common_tags
}

control "redshiftserverless_workgroup_enhanced_vpc_routing_enabled" {
  title         = "Amazon Redshift Serverless workgroups should use enhanced VPC routing"
  description   = "This control checks whether enhanced VPC routing is enabled for an Amazon Redshift Serverless workgroup. The control fails if enhanced VPC routing is disabled for the workgroup."
  query         = query.redshiftserverless_workgroup_enhanced_vpc_routing_enabled

  tags = local.conformance_pack_redshiftserverless_common_tags
}

control "redshiftserverless_workgroup_encryption_in_transit_enabled" {
  title         = "Connections to Redshift Serverless workgroups should be required to use SSL"
  description   = "This control checks whether connections to an Amazon Redshift Serverless workgroup are required to encrypt data in transit. The control fails if the require_ssl configuration parameter for the workgroup is set to false."
  query         = query.redshiftserverless_workgroup_encryption_in_transit_enabled

  tags = local.conformance_pack_redshiftserverless_common_tags
}

control "redshiftserverless_workgroup_restrict_public_access" {
  title         = "Redshift Serverless workgroups should prohibit public access"
  description   = "This control checks whether public access is disabled for an Amazon Redshift Serverless workgroup. It evaluates the publiclyAccessible property of a Redshift Serverless workgroup. The control fails if public access is enabled (true) for the workgroup."
  query         = query.redshiftserverless_workgroup_restrict_public_access

  tags = local.conformance_pack_redshiftserverless_common_tags
}

control "redshiftserverless_namespace_export_connection_and_user_log_to_cloudwatch" {
  title         = "Redshift Serverless namespaces should export logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon Redshift Serverless namespace is configured to export connection and user logs to Amazon CloudWatch Logs. The control fails if the Redshift Serverless namespace isn't configured to export the logs to CloudWatch Logs."
  query         = query.redshiftserverless_namespace_export_connection_and_user_log_to_cloudwatch

  tags = local.conformance_pack_redshiftserverless_common_tags
}

query "redshiftserverless_namespace_no_default_admin_username" {
  sql = <<-EOQ
    select
      namespace_arn as resource,
      case
        when admin_username = 'admin' then 'alarm'
        else 'ok'
      end as status,
      case
        when admin_username = 'admin' then title || ' uses default admin username.'
        else title || ' not uses default admin username.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshiftserverless_namespace;
  EOQ
}

query "redshiftserverless_namespace_no_default_database_username" {
  sql = <<-EOQ
    select
      namespace_arn as resource,
      case
        when db_name = 'dev' then 'alarm'
        else 'ok'
      end as status,
      case
        when db_name = 'dev' then title || ' uses default database name.'
        else title || ' not uses default database name.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshiftserverless_namespace;
  EOQ
}

query "redshiftserverless_namespace_export_connection_and_user_log_to_cloudwatch" {
  sql = <<-EOQ
    select
      namespace_arn as resource,
      case
        when log_exports @> '["connectionlog", "userlog"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when log_exports @> '["connectionlog", "userlog"]' then title || ' exports connection and user logs to cloudwatch.'
        when log_exports @> '["connectionlog"]' then title || ' exports only connection logs to cloudwatch.'
        when log_exports @> '["userlog"]' then title || ' exports only user logs to cloudwatch.'
        else title || ' does not export connection and user log to cloudwatch.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshiftserverless_namespace;
  EOQ
}

query "redshiftserverless_workgroup_enhanced_vpc_routing_enabled" {
  sql = <<-EOQ
    select
      workgroup_arn as resource,
      case
        when enhanced_vpc_routing then 'ok'
        else 'alarm'
      end as status,
      case
        when enhanced_vpc_routing then title || ' enhanced VPC routing enabled.'
        else title || ' enhanced VPC routing disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshiftserverless_workgroup;
  EOQ
}

query "redshiftserverless_workgroup_encryption_in_transit_enabled" {
  sql = <<-EOQ
    with workgroup_require_ssl_parameter_value as (
      select
        workgroup_arn
      from
        aws_redshiftserverless_workgroup as w,
        jsonb_array_elements(config_parameters) as p
      where
        p ->> 'ParameterKey' = 'require_ssl'
        and  p ->> 'ParameterValue' = 'true'
    )
    select
      w.workgroup_arn as resource,
      case
        when p.workgroup_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when p.workgroup_arn is not null then title || ' encryption in transit enabled.'
        else title || ' encryption in transit disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshiftserverless_workgroup as w
      left join workgroup_require_ssl_parameter_value as p on w.workgroup_arn = p.workgroup_arn;
  EOQ
}

query "redshiftserverless_workgroup_restrict_public_access" {
  sql = <<-EOQ
    select
      workgroup_arn as resource,
      case
        when not publicly_accessible then 'ok'
        else 'alarm'
      end as status,
      case
        when not publicly_accessible  then title || ' restrict public access.'
        else title || ' allow public access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_redshiftserverless_workgroup;
  EOQ
}
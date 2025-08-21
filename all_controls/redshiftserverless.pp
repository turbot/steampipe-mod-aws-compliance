locals {
  all_controls_redshiftserverless_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/RedshiftServerless"
  })
}

benchmark "all_controls_redshiftserverless" {
  title       = "Redshift Serverless"
  description = "This section contains recommendations for configuring Redshift Serverless resources."
  children = [
    control.redshiftserverless_namespace_export_connection_and_user_log_to_cloudwatch,
    control.redshiftserverless_namespace_no_default_admin_username,
    control.redshiftserverless_namespace_no_default_database_username,
    control.redshiftserverless_workgroup_encryption_in_transit_enabled,
    control.redshiftserverless_workgroup_enhanced_vpc_routing_enabled,
    control.redshiftserverless_workgroup_restrict_public_access
  ]

  tags = merge(local.all_controls_redshiftserverless_common_tags, {
    type = "Benchmark"
  })
}

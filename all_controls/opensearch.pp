locals {
  all_controls_opensearch_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/OpenSearch"
  })
}

benchmark "all_controls_opensearch" {
  title       = "OpenSearch"
  description = "This section contains recommendations for configuring OpenSearch resources."
  children = [
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_cognito_authentication_enabled_for_kibana,
    control.opensearch_domain_data_node_fault_tolerance,
    control.opensearch_domain_encryption_at_rest_enabled,
    control.opensearch_domain_fine_grained_access_enabled,
    control.opensearch_domain_https_required,
    control.opensearch_domain_in_vpc,
    control.opensearch_domain_internal_user_database_disabled,
    control.opensearch_domain_logs_to_cloudwatch,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.opensearch_domain_updated_with_latest_service_software_version
  ]

  tags = merge(local.all_controls_opensearch_common_tags, {
    type = "Benchmark"
  })
}

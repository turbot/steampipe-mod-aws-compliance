
locals {
  conformance_pack_opensearch_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/OPENSEARCH"
  })
}

control "opensearch_domain_encryption_at_rest_enabled" {
  title       = "OpenSearch domains should have encryption at rest enabled"
  description = "This control checks whether Amazon OpenSearch domains have encryption-at-rest configuration enabled. The check fails if encryption at rest is not enabled."
  query       = query.opensearch_domain_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "opensearch_domain_fine_grained_access_enabled" {
  title       = "OpenSearch domains should have fine-grained access control enabled"
  description = "This control checks whether OpenSearch domains have fine-grained access control enabled. The control fails if the fine-grained access control is not enabled. Fine-grained access control requires advanced-security-optionsin the OpenSearch parameter update-domain-config to be enabled."
  query       = query.opensearch_domain_fine_grained_access_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "opensearch_domain_https_required" {
  title       = "OpenSearch domains should use HTTPS"
  description = "This control checks whether connections to OpenSearch domains are using HTTPS. The rule is NON_COMPLIANT if the Amazon OpenSearch domain 'EnforceHTTPS' is not 'true' or is 'true' and 'TLSSecurityPolicy' is not in 'tlsPolicies'."
  query       = query.opensearch_domain_https_required

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "opensearch_domain_audit_logging_enabled" {
  title       = "OpenSearch domains have audit logging enabled."
  description = "This control checks whether Amazon OpenSearch Service domains have audit logging enabled. The rule is NON_COMPLIANT if an OpenSearch Service domain does not have audit logging enabled."
  query       = query.opensearch_domain_audit_logging_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "opensearch_domain_logs_to_cloudwatch" {
  title       = "OpenSearch domains logs to Amazon CloudWatch Logs."
  description = "This control checks whether Amazon OpenSearch Service domains are configured to send logs to Amazon CloudWatch Logs. The rule is NON_COMPLIANT if logging is not configured."
  query       = query.opensearch_domain_logs_to_cloudwatch

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}
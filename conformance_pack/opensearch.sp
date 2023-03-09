
locals {
  conformance_pack_opensearch_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/OPENSEARCH"
  })
}

control "opensearch_domain_encryption_at_rest_enabled" {
  title         = "OpenSearch domains should have encryption at rest enabled"
  description   = "This control checks whether Amazon OpenSearch domains have encryption-at-rest configuration enabled. The check fails if encryption at rest is not enabled."
  query         = query.opensearch_domain_encryption_at_rest_enabled
  tags = merge(local.conformance_pack_opensearch_common_tags, {
    audit_manager_pci_v321_requirement_3 = "true"
  })
}

control "opensearch_domain_fine_grained_access_enabled" {
  title         = "OpenSearch domains should have fine-grained access control enabled"
  description   = "This control checks whether OpenSearch domains have fine-grained access control enabled. The control fails if the fine-grained access control is not enabled. Fine-grained access control requires advanced-security-optionsin the OpenSearch parameter update-domain-config to be enabled."
  query         = query.opensearch_domain_fine_grained_access_enabled
  
  tags = merge(local.conformance_pack_opensearch_common_tags, {
    audit_manager_pci_v321_requirement_7 = "true"
  })
}
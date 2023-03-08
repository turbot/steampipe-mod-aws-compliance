
locals {
  conformance_pack_opensearch_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/OPENSEARCH"
  })
}

control "opensearch_domain_encryption_at_rest_enabled" {
  title         = "OpenSearch domains should have encryption at rest enabled"
  description   = "This control checks whether Amazon OpenSearch domains have encryption-at-rest configuration enabled. The check fails if encryption at rest is not enabled."
  query         = query.opensearch_domain_encryption_at_rest_enabled
  tags = merge(local.conformance_pack_vpc_common_tags, {
    audit_manager_pci_v321_requirement_3 = "true"
  })
}
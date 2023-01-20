locals {
  pci_v321_opensearch_common_tags = merge(local.pci_v321_common_tags, {
    service = "AWS/OpenSearch"
  })
}

benchmark "pci_v321_opensearch" {
  title         = "OpenSearch"
  documentation = file("./pci_v321/docs/pci_v321_opensearch.md")
  children = [
    control.pci_v321_opensearch_1,
    control.pci_v321_opensearch_2
  ]

  tags = merge(local.pci_v321_opensearch_common_tags, {
    type = "Benchmark"
  })
}

control "pci_v321_opensearch_1" {
  title         = "1 Amazon OpenSearch domains should be in a VPC"
  description   = "This control checks whether Amazon OpenSearch domains are in a VPC. It does not evaluate the VPC subnet routing configuration to determine public access."
  severity      = "medium"
  query         = query.opensearch_domain_in_vpc
  documentation = file("./pci_v321/docs/pci_v321_opensearch_1.md")

  tags = merge(local.pci_v321_opensearch_common_tags, {
    pci_item_id      = "opensearch_1"
    pci_requirements = "1.2.1,1.3.1,1.3.2,1.3.4,1.3.6"
  })
}

control "pci_v321_opensearch_2" {
  title         = "2 OpenSearch domains should have encryption at rest enabled"
  description   = "This control checks whether Amazon OpenSearch domains have encryption-at-rest configuration enabled. The check fails if encryption at rest is not enabled."
  severity      = "medium"
  query         = query.opensearch_domain_encryption_at_rest_enabled
  documentation = file("./pci_v321/docs/pci_v321_opensearch_2.md")

  tags = merge(local.pci_v321_opensearch_common_tags, {
    pci_item_id      = "opensearch_2"
    pci_requirements = "3.4"
  })
}

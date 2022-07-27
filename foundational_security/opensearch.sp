locals {
  foundational_security_opensearch_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/OpenSearch"
  })
}

benchmark "foundational_security_opensearch" {
  title         = "Opensearch"
  documentation = file("./foundational_security/docs/foundational_security_opensearch.md")
  children = [
    control.foundational_security_opensearch_7
  ]

  tags = merge(local.foundational_security_opensearch_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_opensearch_7" {
  title         = "7 OpenSearch domains should have fine-grained access control enabled"
  description   = "This control checks whether OpenSearch domains have fine-grained access control enabled. The control fails if the fine-grained access control is not enabled. Fine-grained access control requires advanced-security-optionsin the OpenSearch parameter update-domain-config to be enabled."
  severity      = "high"
  sql           = query.opensearch_domain_fine_grained_access_enabled.sql
  documentation = file("./foundational_security/docs/foundational_security_opensearch_7.md")

  tags = merge(local.foundational_security_opensearch_common_tags, {
    foundational_security_item_id  = "opensearch_7"
    foundational_security_category = "secure_access_management"
  })
}

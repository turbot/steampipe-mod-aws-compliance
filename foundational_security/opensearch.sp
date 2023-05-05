locals {
  foundational_security_opensearch_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/OpenSearch"
  })
}

benchmark "foundational_security_opensearch" {
  title         = "Opensearch"
  documentation = file("./foundational_security/docs/foundational_security_opensearch.md")
  children = [
    control.foundational_security_opensearch_1,
    control.foundational_security_opensearch_2,
    control.foundational_security_opensearch_3,
    control.foundational_security_opensearch_4,
    control.foundational_security_opensearch_5,
    control.foundational_security_opensearch_6,
    control.foundational_security_opensearch_7,
    control.foundational_security_opensearch_8
  ]

  tags = merge(local.foundational_security_opensearch_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_opensearch_1" {
  title         = "1 OpenSearch domains should have encryption at rest enabled"
  description   = "This control checks whether OpenSearch domains have encryption-at-rest configuration enabled. The check fails if encryption at rest is not enabled."
  severity      = "medium"
  query         = query.opensearch_domain_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_opensearch_1.md")

  tags = merge(local.foundational_security_opensearch_common_tags, {
    foundational_security_item_id  = "opensearch_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_opensearch_2" {
  title         = "2 OpenSearch domains should be in a VPC"
  description   = "This control checks whether OpenSearch domains are in a VPC. It does not evaluate the VPC subnet routing configuration to determine public access."
  severity      = "critical"
  query         = query.opensearch_domain_in_vpc
  documentation = file("./foundational_security/docs/foundational_security_opensearch_2.md")

  tags = merge(local.foundational_security_opensearch_common_tags, {
    foundational_security_item_id  = "opensearch_2"
    foundational_security_category = "resources_within_vpc"
  })
}

control "foundational_security_opensearch_3" {
  title         = "3 OpenSearch domains should encrypt data sent between nodes"
  description   = "This control checks whether OpenSearch domains have node-to-node encryption enabled. This control fails if node-to-node encryption is disabled on the domain."
  severity      = "medium"
  query         = query.opensearch_domain_node_to_node_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_opensearch_3.md")

  tags = merge(local.foundational_security_opensearch_common_tags, {
    foundational_security_item_id  = "opensearch_3"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_opensearch_4" {
  title         = "4 OpenSearch domain error logging to CloudWatch Logs should be enabled"
  description   = "This control checks whether OpenSearch domains are configured to send error logs to CloudWatch Logs. This control fails if error logging to CloudWatch is not enabled for a domain."
  severity      = "medium"
  query         = query.opensearch_domain_logs_to_cloudwatch
  documentation = file("./foundational_security/docs/foundational_security_opensearch_4.md")

  tags = merge(local.foundational_security_opensearch_common_tags, {
    foundational_security_item_id  = "opensearch_4"
    foundational_security_category = "logging"
  })
}

control "foundational_security_opensearch_5" {
  title         = "5 OpenSearch domains should have audit logging enabled"
  description   = "This control checks whether OpenSearch domains have audit logging enabled. This control fails if an OpenSearch domain does not have audit logging enabled."
  severity      = "medium"
  query         = query.opensearch_domain_audit_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_opensearch_5.md")

  tags = merge(local.foundational_security_opensearch_common_tags, {
    foundational_security_item_id  = "opensearch_5"
    foundational_security_category = "logging"
  })
}

control "foundational_security_opensearch_6" {
  title         = "6 OpenSearch domains should have at least three data nodes"
  description   = "This control checks whether OpenSearch domains are configured with at least three data nodes and zoneAwarenessEnabled is true. This control fails for an OpenSearch domain if instanceCount is less than 3 or zoneAwarenessEnabled is false."
  severity      = "medium"
  query         = query.opensearch_domain_data_node_fault_tolerance
  documentation = file("./foundational_security/docs/foundational_security_opensearch_6.md")

  tags = merge(local.foundational_security_opensearch_common_tags, {
    foundational_security_item_id  = "opensearch_6"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_opensearch_7" {
  title         = "7 OpenSearch domains should have fine-grained access control enabled"
  description   = "This control checks whether OpenSearch domains have fine-grained access control enabled. The control fails if the fine-grained access control is not enabled. Fine-grained access control requires advanced-security-optionsin the OpenSearch parameter update-domain-config to be enabled."
  severity      = "high"
  query         = query.opensearch_domain_fine_grained_access_enabled
  documentation = file("./foundational_security/docs/foundational_security_opensearch_7.md")

  tags = merge(local.foundational_security_opensearch_common_tags, {
    foundational_security_item_id  = "opensearch_7"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_opensearch_8" {
  title         = "8 Connections to OpenSearch domains should be encrypted using TLS 1.2"
  description   = "This control checks whether connections to OpenSearch domains are required to use TLS 1.2. The check fails if the OpenSearch domain TLSSecurityPolicy is not Policy-Min-TLS-1-2-2019-07."
  severity      = "medium"
  query         = query.opensearch_domain_https_required
  documentation = file("./foundational_security/docs/foundational_security_opensearch_8.md")

  tags = merge(local.foundational_security_opensearch_common_tags, {
    foundational_security_item_id  = "opensearch_8"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}
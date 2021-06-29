locals {
  conformance_pack_es_common_tags = {
    service = "es"
  }
}

control "es_domain_encryption_at_rest_enabled" {
  title       = "ES domain encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elasticsearch Service (Amazon ES) domains"
  sql         = query.es_domain_encryption_at_rest_enabled.sql

  tags = merge(local.conformance_pack_es_common_tags, {
    hipaa               = "true"
    nist_cyber_security = "true"
    rbi_cyber_security  = "true"
  })
}

control "es_domain_in_vpc" {
  title       = "ES domains should be in a VPC"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elasticsearch Service (Amazon ES) Domains are within an Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.es_domain_in_vpc.sql

  tags = merge(local.conformance_pack_es_common_tags, {
    hipaa               = "true"
    nist_cyber_security = "true"
    rbi_cyber_security  = "true"
  })
}

control "es_domain_node_to_node_encryption_enabled" {
  title       = "Elasticsearch domain node-to-node encryption should be enabled"
  description = "Ensure node-to-node encryption for Amazon Elasticsearch Service is enabled. Node-to-node encryption enables TLS 1.2 encryption for all communications within the Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.es_domain_node_to_node_encryption_enabled.sql

  tags = merge(local.conformance_pack_es_common_tags, {
    rbi_cyber_security = "true"
  })
}
locals {
  conformance_pack_es_common_tags = {
    service = "es"
  }
}

control "es_domain_encryption_at_rest_enabled" {
  title       = "ES domain encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elasticsearch Service (Amazon ES) domains"
  sql         = query.es_domain_encryption_at_rest_enabled.sql
  tags        = local.conformance_pack_es_common_tags
}

control "es_domain_in_vpc" {
  title       = "Amazon ES domains are in VPC"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elasticsearch Service (Amazon ES) Domains are within an Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.es_domain_in_vpc.sql
  tags        = local.conformance_pack_es_common_tags
}

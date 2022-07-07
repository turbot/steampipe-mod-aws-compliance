locals {
  conformance_pack_es_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ES"
  })
}

control "es_domain_encryption_at_rest_enabled" {
  title       = "ES domain encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elasticsearch Service (Amazon ES) domains"
  sql         = query.es_domain_encryption_at_rest_enabled.sql

  tags = merge(local.conformance_pack_es_common_tags, {
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "es_domain_in_vpc" {
  title       = "ES domains should be in a VPC"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elasticsearch Service (Amazon ES) Domains are within an Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.es_domain_in_vpc.sql

  tags = merge(local.conformance_pack_es_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "es_domain_node_to_node_encryption_enabled" {
  title       = "Elasticsearch domain node-to-node encryption should be enabled"
  description = "Ensure node-to-node encryption for Amazon Elasticsearch Service is enabled. Node-to-node encryption enables TLS 1.2 encryption for all communications within the Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.es_domain_node_to_node_encryption_enabled.sql

  tags = merge(local.conformance_pack_es_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "es_domain_logs_to_cloudwatch" {
  title       = "Elasticsearch domain should send logs to CloudWatch"
  description = "Ensure if Amazon OpenSearch Service (OpenSearch Service) domains are configured to send logs to Amazon CloudWatch Logs. The rule is complaint if a log is enabled for an OpenSearch Service domain. This rule is non compliant if logging is not configured."
  sql         = query.es_domain_logs_to_cloudwatch.sql

  tags = merge(local.conformance_pack_es_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "es_domain_cognito_authentication_enabled" {
  title       = "Elasticsearch domains should have cognito authentication enabled"
  description = "Amazon Elasticsearch service uses Amazon Cognito to offer user name and password protection for Kibana. This control is non compliant if Amazon Cognito authentication is not enabled."
  sql         = query.es_domain_cognito_authentication_enabled.sql

  tags = merge(local.conformance_pack_es_common_tags, {
    other_checks = "true"
  })
}

control "es_domain_internal_user_database_enabled" {
  title       = "Elasticsearch domains should have internal user database enabled"
  description = "Ensure Elasticsearch domains have internal user database enabled. This control is non compliant if a domain's internal user database is not enabled."
  sql         = query.es_domain_internal_user_database_enabled.sql

  tags = merge(local.conformance_pack_es_common_tags, {
    other_checks = "true"
  })
}

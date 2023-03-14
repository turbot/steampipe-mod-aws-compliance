locals {
  conformance_pack_opensearch_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/OpenSearch"
  })
}

control "opensearch_domain_audit_logging_enabled" {
  title       = "OpenSearch domain audit logging should be enabled"
  description = "This control checks if OpenSearch Service domains have audit logging enabled. The rule is non compliant if an OpenSearch Service domain does not have audit logging enabled."
  query       = query.opensearch_domain_audit_logging_enabled

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    soc_2 = "true"
  })
}

control "opensearch_domain_logs_to_cloudwatch" {
  title       = "OpenSearch domain should send logs to CloudWatch"
  description = "This control checks if OpenSearch Service domains are configured to send logs to Amazon CloudWatch Logs. The rule is non compliant if logging is not configured."
  query       = query.opensearch_domain_logs_to_cloudwatch

  tags = merge(local.conformance_pack_opensearch_common_tags, {
    soc_2 = "true"
  })
}


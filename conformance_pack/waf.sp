locals {
  conformance_pack_waf_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/waf"
  })
}

control "waf_web_acl_logging_enabled" {
  title       = "Logging should be enabled on on AWS Web Application Firewall (WAF) classic global web ACLs"
  description = "To help with logging and monitoring within your environment, enable AWS WAF logging on regional and global web ACLs. This rule is NON_COMPLIANT for a global web ACL, if it does not have logging enabled."
  query       = query.waf_web_acl_logging_enabled

  tags = merge(local.conformance_pack_waf_common_tags, {
    audit_manager_pci_v321_requirement_3 = "true"
  })
}

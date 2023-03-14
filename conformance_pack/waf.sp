locals {
  conformance_pack_waf_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/waf"
  })
}

control "waf_rule_condition_attached" {
  title       = "A WAF global rule should have at least one condition"
  description = "This control checks whether an AWS WAF global rule contains any conditions. The control fails if no conditions are present within a rule."
  query       = query.waf_rule_condition_attached

  tags = merge(local.conformance_pack_waf_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "waf_rule_group_rule_attached" {
  title       = "A WAF global rule group should have at least one rule"
  description = "This control checks whether an AWS WAF global rule group has at least one rule. The control fails if no rules are present within a rule group."
  query       = query.waf_rule_group_rule_attached

  tags = merge(local.conformance_pack_waf_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "waf_web_acl_rule_attached" {
  title       = "A WAF global web ACL should have at least one rule or rule group"
  description = "This control checks whether an AWS WAF global web ACL contains at least one WAF rule or WAF rule group. The control fails if a web ACL does not contain any WAF rules or rule groups."
  query       = query.waf_web_acl_rule_attached

  tags = merge(local.conformance_pack_waf_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "waf_web_acl_logging_enabled" {
  title       = "Logging should be enabled on on AWS Web Application Firewall (WAF) classic global web ACLs"
  description = "To help with logging and monitoring within your environment, enable AWS WAF logging on regional and global web ACLs. This rule is NON_COMPLIANT for a global web ACL, if it does not have logging enabled."
  query       = query.waf_web_acl_logging_enabled

  tags = merge(local.conformance_pack_waf_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

control "waf_regional_rule_condition_attached" {
  title         = "A WAF regional rule should have at least one condition"
  description   = "This control checks whether an AWS WAF regional rule contains any conditions. The control fails if no conditions are present within a rule."
  query         = query.waf_regional_rule_condition_attached

  tags = merge(local.conformance_pack_waf_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}

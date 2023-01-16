locals {
  foundational_security_waf_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/WAF"
  })
}

benchmark "foundational_security_waf" {
  title         = "WAF"
  documentation = file("./foundational_security/docs/foundational_security_waf.md")
  children = [
    control.foundational_security_waf_6,
    control.foundational_security_waf_7,
    control.foundational_security_waf_8,
    control.foundational_security_waf_10
  ]

  tags = merge(local.foundational_security_waf_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_waf_6" {
  title         = "6 A WAF global rule should have at least one condition"
  description   = "This control checks whether an AWS WAF global rule contains any conditions. The control fails if no conditions are present within a rule."
  severity      = "medium"
  sql           = query.waf_rule_condition_attached.sql
  documentation = file("./foundational_security/docs/foundational_security_waf_6.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_6"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_waf_7" {
  title         = "7 A WAF global rule group should have at least one rule"
  description   = "This control checks whether an AWS WAF global rule group has at least one rule. The control fails if no rules are present within a rule group."
  severity      = "medium"
  sql           = query.waf_rule_group_rule_attached.sql
  documentation = file("./foundational_security/docs/foundational_security_waf_7.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_7"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_waf_8" {
  title         = "8 A WAF global web ACL should have at least one rule or rule group"
  description   = "This control checks whether an AWS WAF global web ACL contains at least one WAF rule or WAF rule group. The control fails if a web ACL does not contain any WAF rules or rule groups."
  severity      = "medium"
  sql           = query.waf_web_acl_rule_attached.sql
  documentation = file("./foundational_security/docs/foundational_security_waf_8.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_8"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_waf_10" {
  title         = "10 A WAFV2 web ACL should have at least one rule or rule group"
  description   = "This control checks whether a WAFV2 web access control list (web ACL) contains at least one WAF rule or WAF rule group. The control fails if a web ACL does not contain any WAF rules or rule groups."
  severity      = "medium"
  sql           = query.wafv2_web_acl_rule_attached.sql
  documentation = file("./foundational_security/docs/foundational_security_waf_10.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_10"
    foundational_security_category = "secure_network_configuration"
  })
}

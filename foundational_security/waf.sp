locals {
  foundational_security_waf_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/WAF"
  })
}

benchmark "foundational_security_waf" {
  title         = "WAF"
  documentation = file("./foundational_security/docs/foundational_security_waf.md")
  children = [
    control.foundational_security_waf_1,
    control.foundational_security_waf_2,
    control.foundational_security_waf_3,
    control.foundational_security_waf_4,
    control.foundational_security_waf_6,
    control.foundational_security_waf_7,
    control.foundational_security_waf_8,
    control.foundational_security_waf_10,
    control.foundational_security_waf_12
  ]

  tags = merge(local.foundational_security_waf_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_waf_1" {
  title         = "1 AWS WAF Classic Global Web ACL logging should be enabled"
  description   = "This control checks whether logging is enabled for an AWS WAF global web ACL. This control fails if logging is not enabled for the web ACL."
  severity      = "medium"
  query         = query.waf_web_acl_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_waf_1.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_1"
    foundational_security_category = "logging"
  })
}

control "foundational_security_waf_2" {
  title         = "2 AWS WAF Classic Regional rules should have at least one condition"
  description   = "This control checks whether an AWS WAF Regional rule has at least one condition. The control fails if no conditions are present within a rule."
  severity      = "medium"
  query         = query.waf_regional_rule_condition_attached
  documentation = file("./foundational_security/docs/foundational_security_waf_2.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_2"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_waf_3" {
  title         = "3 AWS WAF Classic Regional rule groups should have at least one rule"
  description   = "This control checks whether an AWS WAF Regional rule group has at least one rule. The control fails if no rules are present within a rule group."
  severity      = "medium"
  query         = query.waf_regional_rule_group_rule_attached
  documentation = file("./foundational_security/docs/foundational_security_waf_3.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_3"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_waf_4" {
  title         = "4 AWS WAF Classic Regional web ACLs should have at least one rule or rule group"
  description   = "This control checks whether an AWS WAF Classic Regional web ACL contains any WAF rules or WAF rule groups. This control fails if a web ACL does not contain any WAF rules or rule groups."
  severity      = "medium"
  query         = query.waf_regional_web_acl_rule_attached
  documentation = file("./foundational_security/docs/foundational_security_waf_4.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_4"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_waf_6" {
  title         = "6 AWS WAF Classic global rules should have at least one condition"
  description   = "This control checks whether an AWS WAF global rule contains any conditions. The control fails if no conditions are present within a rule."
  severity      = "medium"
  query         = query.waf_rule_condition_attached
  documentation = file("./foundational_security/docs/foundational_security_waf_6.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_6"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_waf_7" {
  title         = "7 AWS WAF Classic global rule groups should have at least one rule"
  description   = "This control checks whether an AWS WAF global rule group has at least one rule. The control fails if no rules are present within a rule group."
  severity      = "medium"
  query         = query.waf_rule_group_rule_attached
  documentation = file("./foundational_security/docs/foundational_security_waf_7.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_7"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_waf_8" {
  title         = "8 AWS WAF Classic global web ACLs should have at least one rule or rule group"
  description   = "This control checks whether an AWS WAF global web ACL contains at least one WAF rule or WAF rule group. The control fails if a web ACL does not contain any WAF rules or rule groups."
  severity      = "medium"
  query         = query.waf_web_acl_rule_attached
  documentation = file("./foundational_security/docs/foundational_security_waf_8.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_8"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_waf_10" {
  title         = "10 AWS WAF web ACLs should have at least one rule or rule group"
  description   = "This control checks whether a WAFV2 web access control list (web ACL) contains at least one WAF rule or WAF rule group. The control fails if a web ACL does not contain any WAF rules or rule groups."
  severity      = "medium"
  query         = query.wafv2_web_acl_rule_attached
  documentation = file("./foundational_security/docs/foundational_security_waf_10.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_10"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_waf_12" {
  title         = "12 AWS WAF rules should have CloudWatch metrics enabled"
  description   = "This control checks whether an AWS WAF rule or rule group has Amazon CloudWatch metrics enabled. The control fails if the rule or rule group doesn't have CloudWatch metrics enabled."
  severity      = "medium"
  query         = query.wafv2_rule_group_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_waf_12.md")

  tags = merge(local.foundational_security_waf_common_tags, {
    foundational_security_item_id  = "waf_12"
    foundational_security_category = "logging"
  })
}
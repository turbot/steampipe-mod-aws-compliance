benchmark "hipaa_security_rule_2003_164_308_a_1_ii_a" {
  title       = "164.308(a)(1)(ii)(A) Risk analysis"
  description = "Conduct an accurate and thorough assessment of the potential risks and vulnerabilities to the confidentiality, integrity, and availability of electronic protected health information held by the covered entity."
  children = [
    control.cloudtrail_trail_enabled,
    control.config_enabled_all_regions,
    control.guardduty_enabled
  ]

  tags = merge(local.hipaa_security_rule_2003_164_308_common_tags, {
    hipaa_security_rule_2003_item_id = "164_308_a_1_ii_a"
  })
}

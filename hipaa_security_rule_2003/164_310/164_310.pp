locals {
  hipaa_security_rule_2003_164_310_common_tags = merge(local.hipaa_security_rule_2003_common_tags, {
    hipaa_section = "164_310"
  })
}

benchmark "hipaa_security_rule_2003_164_310" {
  title       = "164.310 Physical Safeguards"
  description = "The Security Rule defines physical safeguards to manage the selection, development, implementation, and maintenance of security measures to protect electronic protected health information and to manage the conduct of the covered entity's or business associate's workforce in relation to the protection of that information."
  children = [
    benchmark.hipaa_security_rule_2003_164_310_d_2_iv
  ]

  tags = local.hipaa_security_rule_2003_164_310_common_tags
}

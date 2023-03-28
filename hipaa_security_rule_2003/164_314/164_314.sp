locals {
  hipaa_security_rule_2003_164_314_common_tags = merge(local.hipaa_security_rule_2003_common_tags, {
    hipaa_section = "164_314"
  })
}

benchmark "hipaa_security_rule_2003_164_314" {
  title       = "164.314 Technical Safeguards"
  description = "The Security Rule defines technical safeguards in § 164.304 as `the technology and the policy and procedures for its use that protect electronic protected health information and control access to it.`"

  children = [
    benchmark.hipaa_security_rule_2003_164_314_b_1,
    benchmark.hipaa_security_rule_2003_164_314_b_2
  ]

  tags = local.hipaa_security_rule_2003_164_314_common_tags
}

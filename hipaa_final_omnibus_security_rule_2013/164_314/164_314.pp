locals {
  hipaa_final_omnibus_security_rule_2013_164_314_common_tags = merge(local.hipaa_final_omnibus_security_rule_2013_common_tags, {
    hipaa_section = "164_314"
  })
}

benchmark "hipaa_final_omnibus_security_rule_2013_164_314" {
  title       = "164.314 Organizational Requirements"
  description = "The Security Rule includes the Standard, Business associate contracts or other arrangements. A covered entity is not in compliance with the standard if the it knows of a pattern of an activity or practice of the business associate that constitutes a material breach or violation of the business associate's obligation to safeguard ePHI (under the contract or other arrangement), unless the covered entity takes reasonable steps to cure the breach or end the violation, as applicable. If such steps are unsuccessful, the covered entity is required to terminate the contract or arrangement, if feasible or if termination is not feasible, report the problem to the Secretary (HHS)."
  children = [
    benchmark.hipaa_final_omnibus_security_rule_2013_164_314_b_1,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_314_b_2,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_314_b_2_i,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_314_b_2_ii,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_314_b_2_iii,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_314_b_2_iv
  ]

  tags = local.hipaa_final_omnibus_security_rule_2013_164_314_common_tags
}

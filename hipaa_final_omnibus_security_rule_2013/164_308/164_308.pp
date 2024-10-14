locals {
  hipaa_final_omnibus_security_rule_2013_164_308_common_tags = merge(local.hipaa_final_omnibus_security_rule_2013_common_tags, {
    hipaa_section = "164_308"
  })
}

benchmark "hipaa_final_omnibus_security_rule_2013_164_308" {
  title       = "164.308 Administrative Safeguards"
  description = "An important step in strengthening the protection of health information, especially in electronic form, as well as give patients more access to their individual health information. The HIPAA Omnibus Rule is a set of final regulations that modifies the existing HIPAA rules and implements a variety of provisions of the Health Information Technology for Economic and Clinical Health (HITECH) Act."
  children = [
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_1_ii_a,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_1_ii_b,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_1_ii_d,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_3_i,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_3_ii_a,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_3_ii_b,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_3_ii_c,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_4_i,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_4_ii_a,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_4_ii_b,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_4_ii_c,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_5_ii_b,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_5_ii_c,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_5_ii_d,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_6_i,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_6_ii,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_7_i,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_7_ii_a,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_7_ii_b,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_7_ii_c,
    benchmark.hipaa_final_omnibus_security_rule_2013_164_308_a_8
  ]

  tags = local.hipaa_final_omnibus_security_rule_2013_164_308_common_tags

}


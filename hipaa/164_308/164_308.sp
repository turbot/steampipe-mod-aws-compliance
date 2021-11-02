benchmark "hipaa_164_308" {
  title       = "164.308 Administrative Safeguards"
  description = "An important step in protecting electronic protected health information (EPHI) is to implement reasonable and appropriate administrative safeguards that establish the foundation for a covered entity’s security program. The Administrative Safeguards standards in the Security Rule, at § 164.308, were developed to accomplish this purpose."
  children = [
    benchmark.hipaa_164_308_a_4_ii_b,
    benchmark.hipaa_164_308_a_4_ii_c,
    benchmark.hipaa_164_308_a_6_i,
    benchmark.hipaa_164_308_a_6_ii,
    benchmark.hipaa_164_308_a_7_i,
    benchmark.hipaa_164_308_a_7_ii_a,
    benchmark.hipaa_164_308_a_1_ii_b,
    benchmark.hipaa_164_308_a_1_ii_d,
    benchmark.hipaa_164_308_a_3_i,
    benchmark.hipaa_164_308_a_3_ii_b,
    benchmark.hipaa_164_308_a_3_ii_c,
    benchmark.hipaa_164_308_a_4_i
  ]

  tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308"
  })
}

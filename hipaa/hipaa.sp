locals {
  hipaa_common_tags = {
    benchmark = "hipaa"
    plugin    = "aws"
  }
}

benchmark "hipaa" {
  title       = "HIPAA"
  description = "The AWS Health Insurance Portability and Accountability (HIPAA) is a set of controls to use the secure AWS environment to process, maintain, and store protected health information."
  children = [
    benchmark.hipaa_164_308_a_1_ii_b,
    benchmark.hipaa_164_308_a_1_ii_d,
    benchmark.hipaa_164_308_a_3_i,
    benchmark.hipaa_164_308_a_3_ii_a,
    benchmark.hipaa_164_308_a_3_ii_b,
    benchmark.hipaa_164_308_a_3_ii_c,
    benchmark.hipaa_164_308_a_4_i,
    benchmark.hipaa_164_308_a_4_ii_b,
    benchmark.hipaa_164_308_a_4_ii_c,
    benchmark.hipaa_164_308_a_6_i,
    benchmark.hipaa_164_308_a_6_ii,
    benchmark.hipaa_164_308_a_7_i,
    benchmark.hipaa_164_308_a_7_ii_a,
    benchmark.hipaa_164_312_a_1,
    benchmark.hipaa_164_312_a_2_i,
    benchmark.hipaa_164_312_a_2_ii,
    benchmark.hipaa_164_312_a_2_iv,
    benchmark.hipaa_164_312_b,
    benchmark.hipaa_164_312_c_1,
    benchmark.hipaa_164_312_c_2,
    benchmark.hipaa_164_312_d,
    benchmark.hipaa_164_312_e_1,
    benchmark.hipaa_164_312_e_2_i,
    benchmark.hipaa_164_312_e_2_ii
  ]
  tags = local.hipaa_common_tags
}

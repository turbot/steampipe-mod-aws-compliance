locals {
  hipaa_common_tags = {
    benchmark = "hipaa"
    plugin    = "aws"
  }
}

benchmark "hipaa" {
  title         = "HIPAA"
  description   = "The AWS Health Insurance Portability and Accountability (HIPAA) is a set of controls to use the secure AWS environment to process, maintain, and store protected health information."
  #documentation = file("./hipaa/docs/hipaa_overview.md")
  children = [
    benchmark.hipaa_164_308_a_1_ii_B,
    benchmark.hipaa_164_308_a_1_ii_D,
    benchmark.hipaa_164_308_a_3_ii_A,
    benchmark.hipaa_164_308_a_3_ii_B
  ]
  tags = local.hipaa_common_tags
}

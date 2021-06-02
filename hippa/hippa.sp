locals {
  hippa_common_tags = {
    benchmark = "hippa"
    plugin    = "aws"
  }
}

benchmark "hippa" {
  title         = "HIPPA"
  description   = "The AWS Health Insurance Portability and Accountability (HIPAA) is a set of controls to use the secure AWS environment to process, maintain, and store protected health information."
  #documentation = file("./hippa/docs/hippa_overview.md")
  children = [
    benchmark.hippa_164_308_a_1_ii_B
  ]
  tags = local.hippa_common_tags
}

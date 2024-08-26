locals {
  acsc_essential_eight_ml_1_common_tags = merge(local.acsc_essential_eight_common_tags, {
    maturity_level = "1"
  })
}

benchmark "acsc_essential_eight_ml_1" {
  title       = "A1 Additional Criterial for Availability"
  description = "The availability category refers to the accessibility of information used by the entity’s systems, as well as the products or services provided to its customers."

  children = [
    benchmark.acsc_essential_eight_ml_1_2_1
  ]

  tags = local.soc_2_a_1_common_tags
}

benchmark "acsc_essential_eight_ml_1_2_1" {
  title       = "ACSC-EE-ML1-2.1: Patch applications ML1"
  description = "An automated method of asset discovery is used at least fortnightly to support the detection of assets for subsequent vulnerability scanning activities."

  children = [

  ]

  tags = local.acsc_essential_eight_ml_1_common_tags
}

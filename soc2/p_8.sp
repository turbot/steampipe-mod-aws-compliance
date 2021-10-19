locals {
  soc_2_p_8_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "p8"
  })
}

benchmark "p_8" {
  title       = "P8.0 - Privacy Criteria Related to Monitoring and Enforcement"
  description = "This category refers to privacy criteria related to monitoring and enforcement."

  children = [
    benchmark.p_8_1
  ]

  tags = local.soc_2_p_8_common_tags
}

benchmark "p_8_1" {
  title         = "P8.1 The entity implements a process for receiving, addressing, resolving, and communicating the resolution of inquiries, complaints, and disputes from data subjects and others and periodically monitors compliance to meet the entity’s objectives related to privacy. Corrections and other necessary actions related to identified deficiencies are made or taken in a timely manner"
  documentation = file("./soc2/docs/p_8_1.md")

  children = [
    control.manual_control
  ]

  tags = merge(local.soc_2_p_8_common_tags, {
    soc_2_item_id = "8.1"
    soc_2_type    = "manual"
  })
}
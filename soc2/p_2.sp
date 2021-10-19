locals {
  soc_2_p_2_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "p2"
  })
}

benchmark "p_2" {
  title       = "P2.0 - Privacy Criteria Related to Choice and Consent"
  description = "This category refers to privacy criteria related to choice and consent."

  children = [
    benchmark.p_2_1
  ]

  tags = local.soc_2_p_2_common_tags
}

benchmark "p_2_1" {
  title         = "P2.1 The entity communicates choices available regarding the collection, use, retention, disclosure, and disposal of personal information to the data subjects and the consequences, if any, of each choice. Explicit consent for the collection, use, retention, disclosure, and disposal of personal information is obtained from data subjects or other authorized persons, if required. Such consent is obtained only for the intended purpose of the information to meet the entity’s objectives related to privacy. The entity’s basis for determining implicit consent for the collection, use, retention, disclosure, and disposal of personal information is documented."
  documentation = file("./soc2/docs/p_2_1.md")

  children = [
    control.manual_control
  ]
  
  tags = merge(local.soc_2_p_2_common_tags, {
    soc_2_item_id = "2.1"
    soc_2_type    = "manual"
  })
}

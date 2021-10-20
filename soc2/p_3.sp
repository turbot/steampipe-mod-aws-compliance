locals {
  soc_2_p_3_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "p3"
  })
}

benchmark "p_3" {
  title       = "P3.0 - Privacy Criteria Related to Collection"
  description = "This category refers to privacy criteria related to collection. All confidential information and personally identifiable material should be entirely secure, from the point of collection to when it is used, disclosed, and eventually disposed of"

  children = [
    benchmark.p_3_1,
    benchmark.p_3_2
  ]

  tags = local.soc_2_p_3_common_tags
}

benchmark "p_3_1" {
  title         = "P3.1 Personal information is collected consistent with the entity’s objectives related to privacy"
  documentation = file("./soc2/docs/p_3_1.md")

  children = [
    control.manual_control
  ]

  tags = merge(local.soc_2_p_3_common_tags, {
    soc_2_item_id = "3.1"
    soc_2_type    = "manual"
  })
}

benchmark "p_3_2" {
  title         = "P3.2 Managing personal information to meet the entity’s objectives related to privacy"
  documentation = file("./soc2/docs/p_3_2.md")

  children = [
    control.manual_control
  ]

  tags = merge(local.soc_2_p_3_common_tags, {
    soc_2_item_id = "3.2"
    soc_2_type    = "manual"
  })
}

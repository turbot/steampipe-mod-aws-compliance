locals {
  soc_2_p_3_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "p3"
  })
}

benchmark "p_3" {
  title       = "P3.0 - Privacy Criteria Related to Collection"
  description = "This category refers to privacy criteria related to collection. All confidential information and personally identifiable material should be entirely secure, from the point of collection to when it is used, disclosed, and eventually disposed of"

  children = [
    control.p_3_1,
    control.p_3_2
  ]

  tags = local.soc_2_p_3_common_tags
}

control "p_3_1" {
  title         = "P3.1 Personal information is collected consistent with the entity’s objectives related to privacy"
  sql           = query.manual_control.sql
  documentation = file("./soc2/docs/p_3_1.md")

  tags = merge(local.soc_2_p_3_common_tags, {
    soc_2_item_id = "3.1"
    soc_2_type    = "manual"
  })
}

control "p_3_2" {
  title         = "P3.2 For information requiring explicit consent, the entity communicates the need for such consent, as well as the consequences of a failure to provide consent for the request for personal information, and obtains the consent prior to the collection of the information to meet the entity’s objectives related to privacy"
  sql           = query.manual_control.sql
  documentation = file("./soc2/docs/p_3_2.md")

  tags = merge(local.soc_2_p_3_common_tags, {
    soc_2_item_id = "3.2"
    soc_2_type    = "manual"
  })
}

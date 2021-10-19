locals {
  soc_2_cc_9_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc9"
  })
}

benchmark "cc_9" {
  title       = "CC9.0 - Risk Mitigation"
  description = "The criteria relevant to how the entity identifies, selects and develops risk mitigation activities arising from potential business disruptions and the use of vendors and business partners."

  children = [
    control.cc_9_1,
    control.cc_9_2,
  ]
  
  tags = local.soc_2_cc_9_common_tags
}

control "cc_9_1" {
  title         = "CC9.1 The entity identifies, selects, and develops risk mitigation activities for risks arising from potential business disruptions"
  sql           = query.manual_control.sql
  documentation = file("./soc2/docs/cc_9_1.md")

  tags = merge(local.soc_2_cc_9_common_tags, {
    soc_2_item_id = "9.1"
    soc_2_type    = "manual"
  })
}

control "cc_9_2" {
  title         = "CC9.2 The entity assesses and manages risks associated with vendors and business partners"
  sql           = query.manual_control.sql
  documentation = file("./soc2/docs/cc_9_2.md")

  tags = merge(local.soc_2_cc_9_common_tags, {
    soc_2_item_id = "9.2"
    soc_2_type    = "manual"
  })
}

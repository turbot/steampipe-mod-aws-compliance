locals {
  soc_2_cc_1_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc1"
  })
}

benchmark "soc_2_cc_1" {
  title       = "CC1 Common Criteria Related to Control Environment"
  description = "The criteria relevant to how the entity demonstrates commitment to integrity and ethical values, exercises oversight responsibility, establishes structure, authority and responsibility, demonstrates commitment to competence, and enforces accountability."

  children = [
    benchmark.soc_2_cc_1_3
  ]

  tags = local.soc_2_cc_1_common_tags
}

benchmark "soc_2_cc_1_3" {
  title         = "CC1.3 COSO Principle 3: Management establishes, with board oversight, structures, reporting lines, and appropriate authorities and responsibilities in the pursuit of objectives"
  documentation = file("./soc_2/docs/cc_1_3.md")

  children = [
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.rds_db_instance_iam_authentication_enabled
  ]

  tags = merge(local.soc_2_cc_1_common_tags, {
    soc_2_item_id = "1.3"
    soc_2_type    = "automated"
  })
}

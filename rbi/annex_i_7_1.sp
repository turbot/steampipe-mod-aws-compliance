locals {
  rbi_annex_i_7_1_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_7_1"
  })
}

benchmark "rbi_annex_i_7_1" {
  title       = "Annex_I(7.1)"
  description = "TODO"
  children = [
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies
  ]
  tags = local.rbi_annex_i_7_1_common_tags
}
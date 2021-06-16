locals {
  rbi_annex_i_7_2_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_7_2"
  })
}

benchmark "rbi_annex_i_7_2" {
  title       = "Annex_I(7.2)"
  description = "TODO"
  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]
  tags = local.rbi_annex_i_7_2_common_tags
}
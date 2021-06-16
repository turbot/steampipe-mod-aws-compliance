locals {
  rbi_annex_i_7_3_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_7_3"
  })
}

benchmark "rbi_annex_i_7_3" {
  title       = "Annex_I(7.3)"
  description = "TODO"
  children = [
    control.vpc_security_group_restrict_ssh
  ]
  tags = local.rbi_annex_i_7_3_common_tags
}
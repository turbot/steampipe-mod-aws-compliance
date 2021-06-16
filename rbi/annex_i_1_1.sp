locals {
  rbi_annex_i_1_1_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_1_1"
  })
}

benchmark "rbi_annex_i_1_1" {
  title       = "Annex_I(1.1)"
  description = "TODO"
  children = [
    control.ec2_instance_ssm_managed
  ]
  tags = local.rbi_annex_i_1_1_common_tags
}
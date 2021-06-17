locals {
  rbi_annex_i_6_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_6"
  })
}

benchmark "rbi_annex_i_6" {
  title       = "Annex_I(6)"
  description = "TODO"
  children = [
    control.guardduty_finding_archived,
    ssm_managed_instance_compliance_association_compliant,
    ssm_managed_instance_compliance_patch_compliant
  ]
  tags = local.rbi_annex_i_6_common_tags
}
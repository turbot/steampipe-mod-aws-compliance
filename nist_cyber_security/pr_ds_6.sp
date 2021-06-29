benchmark "nist_cyber_security_pr_ds_6" {
  title       = "PR.DS-6"
  description = "Integrity checking mechanisms are used to verify software, firmware, and information integrity."

  children = [
    control.cloudtrail_trail_validation_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ds_6"
  })
}

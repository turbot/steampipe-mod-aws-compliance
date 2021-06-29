benchmark "nist_cyber_security_pr_ma_2" {
  title       = "PR.MA-2"
  description = "Remote maintenance of organizational assets is approved, logged, and performed in a manner that prevents unauthorized access."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ma_2"
  })
}

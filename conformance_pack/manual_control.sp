locals {
  conformance_pack_manual_common_tags = {}
}

control "manual_control" {
  title       = "Manual Control"
  description = "Manual verification is required."
  sql         = query.manual_control.sql

  tags = merge(local.conformance_pack_manual_common_tags, {
    soc_2    = "true"
  })
}

locals {
  conformance_pack_guardduty_common_tags = {
    service = "guardduty"
  }
}

control "guardduty_enabled" {
  title       = "GuardDuty should be enabled"
  description = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql         = query.guardduty_enabled.sql
  tags        = local.conformance_pack_guardduty_common_tags
}

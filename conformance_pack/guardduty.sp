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

control "guardduty_finding_archived" {
  title       = "Amazon GuardDuty should not have non archived findings"
  description = "Amazon GuardDuty helps you understand the impact of an incident by classifying findings by severity: low, medium, and high."
  sql         = query.guardduty_finding_archived.sql
  tags        = local.conformance_pack_guardduty_common_tags
}
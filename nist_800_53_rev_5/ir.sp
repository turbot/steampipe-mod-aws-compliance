benchmark "nist_800_53_rev_5_ir" {
  title       = "Incident Response (IR)"
  description = "IR controls are specific to an organization’s incident response policies and procedures. This includes incident response training, testing, monitoring, reporting, and response plan."
  children = [
    benchmark.nist_800_53_rev_5_ir_4
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ir_4" {
  title       = "Incident Handling (IR-4)"
  description = "a. Implement an incident handling capability for incidents that is consistent with the incident response plan and includes preparation, detection and analysis, containment, eradication, and recovery;b. Coordinate incident handling activities with contingency planning activities; c. Incorporate lessons learned from ongoing incident handling activities into incident response procedures, training, and testing, and implement the resulting changes accordingly; and d. Ensure the rigor, intensity, scope, and results of incident handling activities are comparable and predictable across the organization."
  children = [
    benchmark.nist_800_53_rev_5_ir_4_a
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ir_4_a" {
  title       = "IR-4(a)"
  description = "Implement an incident handling capability for incidents that is consistent with the incident response plan and includes preparation, detection and analysis, containment, eradication, and recovery."
  children = [
    control.guardduty_finding_archived
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

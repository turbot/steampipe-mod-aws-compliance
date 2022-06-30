benchmark "ffiec_d_5_er" {
  title       = "Escalation and Reporting (ER)"
  description = "Escalation & Reporting ensures key stakeholders are informed about the impact of cyber incidents, and regulators, law enforcement, and customers are notified as required."
  children = [
    benchmark.ffiec_d_5_er_es_b_4
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_5_er_es_b_4" {
  title       = "D5.ER.Es.B.4"
  description = "Incidents are classified, logged and tracked."
  children = [
    control.guardduty_finding_archived
  ]

  tags = local.ffiec_common_tags
}

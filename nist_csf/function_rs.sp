benchmark "nist_csf_rs" {
  title       = "Respond (RS)"
  description = "Develop and implement appropriate activities to take action regarding a detected cybersecurity incident."

  children = [
    benchmark.nist_csf_rs_an,
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_rs_an" {
  title       = "Analysis (RS.AN)"
  description = "Analysis is conducted to ensure effective response and support recovery activities."

  children = [
    benchmark.nist_csf_rs_an_2,
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_rs_an_2" {
  title       = "RS.AN-2"
  description = "The impact of the incident is understood."

  children = [
    control.guardduty_finding_archived,
  ]

  tags = local.nist_csf_common_tags
}

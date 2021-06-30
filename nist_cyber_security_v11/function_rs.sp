benchmark "nist_cyber_security_v11_rs" {
  title       = "RS Respond"
  description = "Develop and implement appropriate activities to take action regarding a detected cybersecurity incident."

  children = [
    benchmark.nist_cyber_security_v11_rs_an,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_rs_an" {
  title       = "RS.AN Analysis"
  description = "Analysis is conducted to ensure effective response and support recovery activities."

  children = [
    benchmark.nist_cyber_security_v11_rs_an_2,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_rs_an_2" {
  title       = "RS.AN-2"
  description = "The impact of the incident is understood."

  children = [
    control.guardduty_finding_archived,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}
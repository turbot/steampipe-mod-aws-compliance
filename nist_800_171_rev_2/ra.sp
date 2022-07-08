benchmark "nist_800_171_rev_2_3_11" {
  title       = "3.11 Risk Assessment"
  description = "The RA control family relates to an organization’s risk assessment policies and vulnerability scanning capabilities. Using an integrated risk management solution like CyberStrong can help streamline and automate your NIST 800 53 compliance efforts."
  children = [
    benchmark.nist_800_171_rev_2_3_11_2,
    benchmark.nist_800_171_rev_2_3_11_3
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_11_2" {
  title       = "3.11.2"
  description = "Scan for vulnerabilities in organizational systems and applications periodically and when new vulnerabilities affecting those systems and applications are identified."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.guardduty_finding_archived
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_11_3" {
  title       = "3.11.3"
  description = "Remediate vulnerabilities in accordance with risk assessments."
  children = [
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

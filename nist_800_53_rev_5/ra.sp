benchmark "nist_800_53_rev_5_ra" {
  title       = "Risk Assessment (RA)"
  description = "The RA control family relates to an organization’s risk assessment policies and vulnerability scanning capabilities. Using an integrated risk management solution like CyberStrong can help streamline and automate your NIST 800 53 compliance efforts."
  children = [
    benchmark.nist_800_53_rev_5_ra_1,
    benchmark.nist_800_53_rev_5_ra_3,
    benchmark.nist_800_53_rev_5_ra_5,
    benchmark.nist_800_53_rev_5_ra_10
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ra_1" {
  title       = "Policy And Procedures (RA-1)"
  description = "Track risk assessment policies that address purpose, scope, roles, management, and organizational compliance."
  children = [
    benchmark.nist_800_53_rev_5_ra_1_a
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_1_a" {
  title       = "RA-1(a)"
  description = "Establish and maintain a cyber threat hunting capability to: 1. Search for indicators of compromise in organizational systems; and 2. Detect, track, and disrupt threats that evade existing controls."
  children = [
    benchmark.nist_800_53_rev_5_ra_1_a_1,
    benchmark.nist_800_53_rev_5_ra_1_a_2,
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_1_a_1" {
  title       = "RA-1(a)(1)"
  description = "Establish and maintain a cyber threat hunting capability to: 1. Search for indicators of compromise in organizational systems."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_1_a_2" {
  title       = "RA-1(a)(2)"
  description = "a. Establish and maintain a cyber threat hunting capability to: 2. Detect, track, and disrupt threats that evade existing controls."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_3" {
  title       = "Risk Assessment (RA-3)"
  description = "Assess risks and magnitude of unauthorized system access, use, disclosure, disruption, modifications, or destruction."
  children = [
    benchmark.nist_800_53_rev_5_ra_3_4,
    benchmark.nist_800_53_rev_5_ra_3_a_1
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ra_3_4" {
  title       = "RA-3(4) Predictive Cyber Analytics"
  description = "Employ the following advanced automation and analytics capabilities to predict and identify risks to [Assignment: organization-defined systems or system components]: [Assignment: organization-defined advanced automation and analytics capabilities]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_3_a_1" {
  title       = "RA-3(a)(1)"
  description = "a. Conduct a risk assessment, including: 1. Identifying threats to and vulnerabilities in the system."
  children = [
    control.guardduty_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ra_5" {
  title       = "Vulnerability Monitoring And Scanning (RA-5)"
  description = "Employ the following advanced automation and analytics capabilities to predict and identify risks to [Assignment: organization-defined systems or system components]: [Assignment: organization-defined advanced automation and analytics capabilities]."
  children = [
    benchmark.nist_800_53_rev_5_ra_5_4,
    benchmark.nist_800_53_rev_5_ra_5_a
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_5_a" {
  title       = "RA-5(a)"
  description = "Monitor and scan for vulnerabilities in the system and hosted applications [Assignment: organization-defined frequency and/or randomly in accordance with organization-defined process] and when new vulnerabilities potentially affecting the system are identified and reported."
  children = [
    control.guardduty_enabled
  ]
  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_5_4" {
  title       = "RA-5(4) Discoverable Information"
  description = "Determine information about the system that is discoverable and take [Assignment: organization-defined corrective actions]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_10" {
  title       = "Threat Hunting (RA-10)"
  description = "a. Establish and maintain a cyber threat hunting capability to: 1. Search for indicators of compromise in organizational systems; and 2. Detect, track, and disrupt threats that evade existing controls; and b. Employ the threat hunting capability [Assignment: organization-defined frequency]."
  children = [
    benchmark.nist_800_53_rev_5_ra_10_a
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_10_a" {
  title       =  "RA-10(a)"
  description = "Establish and maintain a cyber threat hunting capability to: 1. Search for indicators of compromise in organizational systems; and 2. Detect, track, and disrupt threats that evade existings."
  children = [
    benchmark.nist_800_53_rev_5_ra_10_a_1,
    benchmark.nist_800_53_rev_5_ra_10_a_2,
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_10_a_1" {
  title       =  "RA-10(a)(1)"
  description = "Establish and maintain a cyber threat hunting capability to: 1. Search for indicators of compromise in organizational systems; and 2. Detect, track, and disrupt threats that evade existings."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_ra_10_a_2" {
  title       =  "RA-10(a)(2)"
  description = "a. Establish and maintain a cyber threat hunting capability to: 2. Detect, track, and disrupt threats that evade existings."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}
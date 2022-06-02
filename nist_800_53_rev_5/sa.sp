benchmark "nist_800_53_rev_5_sa" {
  title       = "System and Services Acquisition (SA)"
  description = "The SA control family correlates with controls that protect allocated resources and an organization’s system development life cycle. This includes information system documentation controls, development configuration management controls, and developer security testing and evaluation controls."
  children = [
    benchmark.nist_800_53_rev_5_sa_1,
    benchmark.nist_800_53_rev_5_sa_9,
    benchmark.nist_800_53_rev_5_sa_10,
    benchmark.nist_800_53_rev_5_sa_15
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sa_1" {
  title       = "Policy And Procedures (SA-1)"
  description = "The organization develops, disseminates, and periodically reviews/updates: (i) a formal, documented, system and services acquisition policy that includes information security considerations and that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and (ii) formal, documented procedures to facilitate the implementation of the system and services acquisition policy and associated system and services acquisition controls."
  children = [
    benchmark.nist_800_53_rev_5_sa_1_1
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_800_53_rev_5_sa_1_1" {
  title       = "SA-1(1)"
  description = "Require the developer of the system, system component, or system service to enable integrity verification of software and firmware components."
  children = [
    control.cloudtrail_trail_validation_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_800_53_rev_5_sa_9" {
  title       = "External System Services (SA-9)"
  description = "Require the developer of the system, system component, or system service to enable integrity verification of software and firmware components."
  children = [
    benchmark.nist_800_53_rev_5_sa_9_6
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/KMS"
  })
}

benchmark "nist_800_53_rev_5_sa_9_6" {
  title       = "SA-9(6) Organization-Controlled Cryptographic Keys"
  description = "Maintain exclusive control of cryptographic keys for encrypted material stored or transmitted through an external system."
  children = [
    control.kms_key_not_pending_deletion,
    control.kms_cmk_rotation_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/KMS"
  })
}

benchmark "nist_800_53_rev_5_sa_10" {
  title       = "Developer Configuration Management (SA-10)"
  description = "The organization requires the developer of the information system, system component, or information system service to: a. Perform configuration management during system, component, or service [Selection (one or more): design; development; implementation; operation]; b. Document, manage, and control the integrity of changes to [Assignment: organization-defined configuration items under configuration management]; c. Implement only organization-approved changes to the system, component, or service; d. Document approved changes to the system, component, or service and the potential security impacts of such changes; and e. Track security flaws and flaw resolution within the system, component, or service and report findings to [Assignment: organization-defined personnel]."
  children = [
    benchmark.nist_800_53_rev_5_sa_10_1
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_800_53_rev_5_sa_10_1" {
  title       = "SA-10(1) Software And Firmware Integrity Verification"
  description = "Require the developer of the system, system component, or system service to enable integrity verification of software and firmware components."
  children = [
    control.cloudtrail_trail_validation_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_800_53_rev_5_sa_15" {
  title       = "Development Process, Standards, And Tools (SA-15)"
  description = "a. Require the developer of the system, system component, or system service to follow a documented development process that: 1. Explicitly addresses security and privacy requirements; 2. Identifies the standards and tools used in the development process; 3. Documents the specific tool options and tool configurations used in the development process; and 4. Documents, manages, and ensures the integrity of changes to the process and/or tools used in development; and b. Review the development process, standards, tools, tool options, and tool configurations [Assignment: organization-defined frequency] to determine if the process, standards, tools, tool options and tool configurations selected and employed can satisfy the following security and privacy requirements: [Assignment: organization-defined security and privacy requirements]."
  children = [
    benchmark.nist_800_53_rev_5_sa_15_a_4
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sa_15_a_4" {
  title       = "SA-15(a)(4)"
  description = "a. Require the developer of the system, system component, or system service to follow a documented development process that: 4. Documents, manages, and ensures the integrity of changes to the process and/or tools used in development."
  children = [
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_instance_deletion_protection_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}


benchmark "nist_800_53_rev_4_sa" {
  title       = "System and Services Acquisition (SA)"
  description = "The SA control family correlates with controls that protect allocated resources and an organization’s system development life cycle. This includes information system documentation controls, development configuration management controls, and developer security testing and evaluation controls."
  children = [
    benchmark.nist_800_53_rev_4_sa_3,
    benchmark.nist_800_53_rev_4_sa_10,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_sa_3" {
  title       = "SA-3 System Development Life Cycle"
  description = "The organization manages the information system using organization-defined system development life cycle, defines and documents information security roles and responsibilities throughout the system development life cycle, identifies individuals having information security roles and responsibilities and integrates the organizational information security risk management process into system development life cycle activities."
  children = [
    benchmark.nist_800_53_rev_4_sa_3_a,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_sa_3_a" {
  title       = "SA-3(a) System Development Life Cycle"
  description = "The organization: a. Manages the information system using [Assignment: organization-defined system development life cycle] that incorporates information security considerations."
  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_ssm_managed,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

benchmark "nist_800_53_rev_4_sa_10" {
  title       = "SA-10 Developer Configuration Management"
  description = "The organization requires the developer of the information system, system component, or information system service to: a. Perform configuration management during system, component, or service [Selection (one or more): design; development; implementation; operation]; b. Document, manage, and control the integrity of changes to [Assignment: organization-defined configuration items under configuration management]; c. Implement only organization-approved changes to the system, component, or service; d. Document approved changes to the system, component, or service and the potential security impacts of such changes; and e. Track security flaws and flaw resolution within the system, component, or service and report findings to [Assignment: organization-defined personnel]."
  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}

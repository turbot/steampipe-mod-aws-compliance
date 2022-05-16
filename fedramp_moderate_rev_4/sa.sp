benchmark "fedramp_moderate_rev_4_sa" {
  title       = benchmark.nist_800_53_rev_4_sa.title
  description = benchmark.nist_800_53_rev_4_sa.description
  children = [
    benchmark.fedramp_moderate_rev_4_sa_3,
    benchmark.fedramp_moderate_rev_4_sa_10
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sa_3" {
  title       = benchmark.nist_800_53_rev_4_sa_3.title
  description = benchmark.nist_800_53_rev_4_sa_3.description
  children = [
    benchmark.fedramp_moderate_rev_4_sa_3_a,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sa_3_a" {
  title       = "SA-3(a)"
  description = "The organization: a. Manages the information system using [Assignment: organization-defined system development life cycle] that incorporates information security considerations."
  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_ssm_managed
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sa_10" {
   title       = benchmark.nist_800_53_rev_4_sa_10.title
  description = benchmark.nist_800_53_rev_4_sa_10.description
  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled,
  ]

 tags = local.fedramp_moderate_rev_4_common_tags
}


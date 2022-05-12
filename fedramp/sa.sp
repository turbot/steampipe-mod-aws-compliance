benchmark "fedramp_sa" {
  title       = benchmark.nist_800_53_rev_4_sa.title
  description = benchmark.nist_800_53_rev_4_sa.description
  children = [
    benchmark.fedramp_sa_3,
    benchmark.fedramp_sa_10
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_sa_3" {
  title       = benchmark.nist_800_53_rev_4_sa_3.title
  description = benchmark.nist_800_53_rev_4_sa_3.description
  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_ssm_managed,
    benchmark.fedramp_sa_3_a,
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "low"
  })
}

benchmark "fedramp_sa_3_a" {
  title       = "SA-3(a)"
  description = "The organization: a. Manages the information system using [Assignment: organization-defined system development life cycle] that incorporates information security considerations."
  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_ssm_managed
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_sa_10" {
   title       = benchmark.nist_800_53_rev_4_sa_10.title
  description = benchmark.nist_800_53_rev_4_sa_10.description
  children = [
    control.guardduty_finding_archived,
    control.securityhub_enabled,
    control.ec2_instance_ssm_managed,
    control.guardduty_enabled
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}


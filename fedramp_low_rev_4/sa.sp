benchmark "fedramp_low_rev_4_sa" {
  title       = benchmark.nist_800_53_rev_4_sa.title
  description = benchmark.nist_800_53_rev_4_sa.description
  children = [
    benchmark.fedramp_low_rev_4_sa_3
  ]

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_sa_3" {
  title       = benchmark.nist_800_53_rev_4_sa_3.title
  description = benchmark.nist_800_53_rev_4_sa_3.description
  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_ssm_managed
  ]

  tags = local.fedramp_low_rev_4_common_tags
}


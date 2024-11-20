benchmark "nydfs_23_500_08" {
  title       = "500.08 Application Security"
  description = "Application security Requirement: (b) All such procedures, guidelines and standards shall be reviewed, assessed and updated as necessary by the CISO (or aqualified designee) of the covered entity at least annually."

  children = [
    benchmark.nydfs_23_500_08_a
  ]

  tags = local.nydfs_23_common_tags
}

benchmark "nydfs_23_500_08_a" {
  title       = "500.08(a)"
  description = "Each Covered Entity’s cybersecurity program shall include written procedures, guidelines and standards designed to ensure the use of secure development practices for in-house developed applications utilized by the Covered Entity, and procedures for evaluating, assessing or testing the security of externally developed applications utilized by the Covered Entity within the context of the Covered Entity’s technology environment."

  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured
  ]

  tags = local.nydfs_23_common_tags
}


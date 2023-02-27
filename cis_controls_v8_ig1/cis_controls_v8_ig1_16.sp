benchmark "cis_controls_v8_ig1_16" {
  title       = "16 Application Software Security"
  description = "Manage the security life cycle of in-house developed, hosted, or acquired software to prevent, detect, and remediate security weaknesses before they can impact the enterprise."
  children = [
    benchmark.cis_controls_v8_ig1_16_1,
    benchmark.cis_controls_v8_ig1_16_12
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_16_1" {
  title       = "16.1 - Establish and Maintain a Secure Application Development Process"
  description = "Deploy and maintain anti-malware software on all enterprise assets."
  children = [
    control.codebuild_project_artifact_encryption_enabled,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_logging_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_16_12" {
  title       = "16.12 - Implement Code-Level Security Checks"
  children = [
    control.codebuild_project_artifact_encryption_enabled,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_logging_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}
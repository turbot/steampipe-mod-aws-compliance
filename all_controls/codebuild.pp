locals {
  all_controls_codebuild_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/CodeBuild"
  })
}

benchmark "all_controls_codebuild" {
  title       = "CodeBuild"
  description = "This section contains recommendations for configuring CodeBuild resources."
  children = [
    control.codebuild_project_artifact_encryption_enabled,
    control.codebuild_project_build_greater_then_90_days,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_logging_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_s3_logs_encryption_enabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.codebuild_project_with_user_controlled_buildspec,
    control.codebuild_report_group_export_encryption_at_rest_enabled
  ]

  tags = merge(local.all_controls_codebuild_common_tags, {
    type = "Benchmark"
  })
}

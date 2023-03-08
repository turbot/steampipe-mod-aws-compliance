locals {
  conformance_pack_codebuild_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CodeBuild"
  })
}

control "codebuild_project_plaintext_env_variables_no_sensitive_aws_values" {
  title       = "CodeBuild project plaintext environment variables should not contain sensitive AWS values"
  description = "Ensure authentication credentials AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY do not exist within AWS CodeBuild project environments. Do not store these variables in clear text. Storing these variables in clear text leads to unintended data exposure and unauthorized access."
  query       = query.codebuild_project_plaintext_env_variables_no_sensitive_aws_values

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    cis_controls_v8_ig1    = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "codebuild_project_source_repo_oauth_configured" {
  title       = "CodeBuild GitHub or Bitbucket source repository URLs should use OAuth"
  description = "Ensure the GitHub or Bitbucket source repository URL does not contain personal access tokens, user name and password within AWS Codebuild project environments."
  query       = query.codebuild_project_source_repo_oauth_configured

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    cis_controls_v8_ig1    = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "codebuild_project_logging_enabled" {
  title       = "CodeBuild project logging should be enabled"
  description = "This control checks if an AWS CodeBuild project environment has at least one log option enabled. The rule is non compliant if the status of all present log configurations is set to 'DISABLED'."
  query       = query.codebuild_project_logging_enabled

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    cis_controls_v8_ig1 = "true"
  })
}

control "codebuild_project_environment_privileged_mode_disabled" {
  title       = "CodeBuild project environment privileged mode should be disabled"
  description = "This control checks if an AWS CodeBuild project environment has privileged mode enabled. The rule is non compliant for a CodeBuild project if ‘privilegedMode’ is set to ‘true’."
  query       = query.codebuild_project_environment_privileged_mode_disabled

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    cis_controls_v8_ig1 = "true"
  })
}

control "codebuild_project_artifact_encryption_enabled" {
  title       = "CodeBuild project artifact encryption should be enabled"
  description = "This control checks if an AWS CodeBuild project has encryption enabled for all of its artifacts. The rule is non compliant if 'encryptionDisabled' is set to 'true' for any primary or secondary (if present) artifact configurations."
  query       = query.codebuild_project_artifact_encryption_enabled

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    cis_controls_v8_ig1 = "true"
  })
}

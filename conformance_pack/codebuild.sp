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

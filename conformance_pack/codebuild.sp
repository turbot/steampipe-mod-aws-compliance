locals {
  conformance_pack_codebuild_common_tags = {
    service = "codebuild"
  }
}

control "codebuild_project_plaintext_env_variables_no_sensitive_aws_values" {
  title       = "CodeBuild project plaintext environment variables should not contain sensitive AWS values"
  description = "Ensure authentication credentials AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY do not exist within AWS CodeBuild project environments. Do not store these variables in clear text. Storing these variables in clear text leads to unintended data exposure and unauthorized access."
  sql         = query.codebuild_project_plaintext_env_variables_no_sensitive_aws_values.sql

  tags = merge(local.conformance_pack_codebuild_common_tags, {
    hipaa = "true"
  })
}
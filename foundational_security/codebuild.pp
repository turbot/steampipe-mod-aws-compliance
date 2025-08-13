locals {
  foundational_security_codebuild_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/CodeBuild"
  })
}

benchmark "foundational_security_codebuild" {
  title         = "CodeBuild"
  documentation = file("./foundational_security/docs/foundational_security_codebuild.md")
  children = [
    control.foundational_security_codebuild_1,
    control.foundational_security_codebuild_2,
    control.foundational_security_codebuild_3,
    control.foundational_security_codebuild_4,
    control.foundational_security_codebuild_5,
    control.foundational_security_codebuild_7
  ]

  tags = merge(local.foundational_security_codebuild_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_codebuild_1" {
  title         = "1 CodeBuild Bitbucket source repository URLs should not contain sensitive credentials"
  description   = "Authentication credentials should never be stored or transmitted in clear text or appear in the repository URL. Instead of personal access tokens or user name and password, you should use OAuth to grant authorization for accessing GitHub or Bitbucket repositories. Using personal access tokens or a user name and password could expose your credentials to unintended data exposure and unauthorized access."
  severity      = "critical"
  query         = query.codebuild_project_source_repo_oauth_configured
  documentation = file("./foundational_security/docs/foundational_security_codebuild_1.md")

  tags = merge(local.foundational_security_codebuild_common_tags, {
    foundational_security_item_id  = "codebuild_1"
    foundational_security_category = "secure_development"
  })
}

control "foundational_security_codebuild_2" {
  title         = "2 CodeBuild project environment variables should not contain clear text credentials"
  description   = "This control checks whether the project contains the environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY. Authentication credentials AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY should never be stored in clear text, as this could lead to unintended data exposure and unauthorized access."
  severity      = "critical"
  query         = query.codebuild_project_plaintext_env_variables_no_sensitive_aws_values
  documentation = file("./foundational_security/docs/foundational_security_codebuild_2.md")

  tags = merge(local.foundational_security_codebuild_common_tags, {
    foundational_security_item_id  = "codebuild_2"
    foundational_security_category = "secure_development"
  })
}

control "foundational_security_codebuild_3" {
  title         = "3 CodeBuild S3 logs should be encrypted"
  description   = "This control checks if Amazon S3 logs for an AWS CodeBuild project are encrypted. The control fails if encryption is deactivated for S3 logs for a CodeBuild project."
  severity      = "low"
  query         = query.codebuild_project_s3_logs_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_codebuild_3.md")

  tags = merge(local.foundational_security_codebuild_common_tags, {
    foundational_security_item_id  = "codebuild_3"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}


control "foundational_security_codebuild_4" {
  title         = "4 CodeBuild project environments should have a logging configuration"
  description   = "This control checks whether a CodeBuild project environment has at least one log option, either to S3 or CloudWatch logs enabled. This control fails if a CodeBuild project environment does not have at least one log option enabled."
  severity      = "medium"
  query         = query.codebuild_project_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_codebuild_4.md")

  tags = merge(local.foundational_security_codebuild_common_tags, {
    foundational_security_item_id  = "codebuild_4"
    foundational_security_category = "logging"
  })
}

control "foundational_security_codebuild_5" {
  title         = "5 CodeBuild project environments should not have privileged mode enabled"
  description   = "This control checks if an AWS CodeBuild project environment has privileged mode enabled. This control fails when an AWS CodeBuild project environment has privileged mode enabled."
  severity      = "high"
  query         = query.codebuild_project_environment_privileged_mode_disabled
  documentation = file("./foundational_security/docs/foundational_security_codebuild_5.md")

  tags = merge(local.foundational_security_codebuild_common_tags, {
    foundational_security_item_id  = "codebuild_5"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_codebuild_7" {
  title         = "7 CodeBuild report group exports should be encrypted at rest"
  description   = "This control checks whether the test results of an AWS CodeBuild report group that are exported to an Amazon Simple Storage Service (Amazon S3) bucket are encrypted at rest. The control fails if the report group export isn't encrypted at rest."
  severity      = "medium"
  query         = query.codebuild_report_group_export_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_codebuild_7.md")

  tags = merge(local.foundational_security_codebuild_common_tags, {
    foundational_security_item_id  = "codebuild_7"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

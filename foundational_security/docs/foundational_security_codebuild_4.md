## Description

This control checks whether a CodeBuild project environment has at least one log option, either to S3 or CloudWatch logs enabled. This control fails if a CodeBuild project environment does not have at least one log option enabled.

From a security perspective, logging is an important feature to enable for future forensics efforts in the case of any security incidents. Correlating anomalies in CodeBuild projects with threat detections can increase confidence in the accuracy of those threat detections.

## Remediation

For more information on how to configure CodeBuild project log settings, see [Create a build project (console)](https://docs.aws.amazon.com/codebuild/latest/userguide/create-project-console.html#create-project-console-logs) in the CodeBuild User Guide.
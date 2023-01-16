## Description

This control checks if Amazon S3 logs for an AWS CodeBuild project are encrypted. The control fails if encryption is deactivated for S3 logs for a CodeBuild project.

Encryption of data at rest is a recommended best practice to add a layer of access management around your data. Encrypting the logs at rest reduces the risk that a user not authenticated by AWS will access the data stored on disk. It adds another set of access controls to limit the ability of unauthorized users to access the data.

## Remediation

To change the encryption settings for CodeBuild project S3 logs, see [Change a build project's settings in AWS CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/change-project.html) in the AWS CodeBuild User Guide.
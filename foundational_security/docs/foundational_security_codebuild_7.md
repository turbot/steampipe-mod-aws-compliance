## Description

This control checks whether the test results of an AWS CodeBuild report group that are exported to an Amazon Simple Storage Service (Amazon S3) bucket are encrypted at rest. The control fails if the report group export isn't encrypted at rest.

Data at rest refers to data that's stored in persistent, non-volatile storage for any duration. Encrypting data at rest helps you protect its confidentiality, which reduces the risk that an unauthorized user can access it.

## Remediation

To encrypt the report group export to S3, see [Update a report group](https://docs.aws.amazon.com/codebuild/latest/userguide/report-group-export-settings.html) in the AWS CodeBuild User Guide.
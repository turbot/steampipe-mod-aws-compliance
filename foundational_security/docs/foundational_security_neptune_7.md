## Description

This control checks if a Neptune DB cluster has IAM database authentication enabled. The control fails if IAM database authentication isn't enabled for a Neptune DB cluster.

IAM database authentication for Amazon Neptune database clusters removes the need to store user credentials within the database configuration because authentication is managed externally using IAM. When IAM database authentication is enabled, each request needs to be signed using AWS Signature Version 4.

## Remediation

By default, IAM database authentication is disabled when you create a Neptune DB cluster. To enable it, see [Enabling IAM database authentication in Neptune](https://docs.aws.amazon.com/neptune/latest/userguide/iam-auth-enable.html) in the Neptune User Guide.
## Description

This control checks whether an AWS DMS endpoint for an Amazon Neptune database is configured with IAM authorization. The control fails if the DMS endpoint doesn't have IAM authorization enabled.

AWS Identity and Access Management (IAM) provides fine-grained access control across AWS. With IAM, you can specify who can access which services and resources, and under which conditions. With IAM policies, you manage permissions to your workforce and systems to ensure least-privilege permissions. By enabling IAM authorization on AWS DMS endpoints for Neptune databases, you can grant authorization privileges to IAM users by using a service role specified by the ServiceAccessRoleARN parameter.

## Remediation

To enable IAM authorization on DMS endpoints for Neptune databases, see [Using Amazon Neptune as a target for AWS Database Migration Service](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Neptune.html) in the AWS Database Migration Service User Guide.
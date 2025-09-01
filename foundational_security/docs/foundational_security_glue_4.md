## Description

This control checks whether an AWS Glue for Spark job is configured to run on a supported version of AWS Glue. The control fails if the Spark job is configured to run on a version of AWS Glue that's earlier than the minimum supported version.

Running AWS Glue Spark jobs on current versions of AWS Glue can optimize performance, security, and access to the latest features of AWS Glue. It can also help safeguard against security vulnerabilities. For example, a new version might be released to provide security updates, address issues, or introduce new features.

## Remediation

For information about migrating a Spark job to a supported version of AWS Glue, see [Migrating AWS Glue for Spark jobs](https://docs.aws.amazon.com/glue/latest/dg/migrating-version-40.html) in the AWS Glue User Guide.
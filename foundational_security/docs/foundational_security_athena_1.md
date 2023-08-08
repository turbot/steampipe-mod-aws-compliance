## Description

This control checks if an Athena workgroup is encrypted at rest. The control fails if an Athena workgroup isn’t encrypted at rest.

In Athena, you can create workgroups for running queries for teams, applications, or different workloads. Each workgroup has a setting to enable encryption on all queries. You have the option to use server-side encryption with Amazon Simple Storage Service (Amazon S3) managed keys, server-side encryption with AWS Key Management Service (AWS KMS) keys, or client-side encryption with customer managed KMS keys. Data at rest refers to any data that's stored in persistent, non-volatile storage for any duration. Encryption helps you protect the confidentiality of such data, reducing the risk that an unauthorized user can access it.

## Remediation

To enable encryption at rest for Athena workgroups, see [Edit a workgroup](https://docs.aws.amazon.com/athena/latest/ug/workgroups-create-update-delete.html#editing-workgroups) in the Amazon Athena User Guide. In the Query Result Configuration section, select Encrypt query results.
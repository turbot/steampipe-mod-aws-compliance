## Description

This control checks whether an AWS DMS endpoint for Redis OSS is configured with a TLS connection. The control fails if the endpoint doesn't have TLS enabled.

TLS provides end-to-end security when data is sent between applications or databases over the internet. When you configure SSL encryption for your DMS endpoint, it enables encrypted communication between the source and target databases during the migration process. This helps prevent eavesdropping and interception of sensitive data by malicious actors. Without SSL encryption, sensitive data may be accessed, resulting in data breaches, data loss, or other security incidents.

## Remediation

To enable a TLS connection on DMS endpoints for Redis, see [Using Redis as a target for AWS Database Migration Service](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Target.Redis.html) in the AWS Database Migration Service User Guide.
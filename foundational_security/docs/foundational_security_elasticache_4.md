## Description

This control checks if ElastiCache for Redis replication groups are encrypted at rest. This control fails if an ElastiCache for Redis replication group isn't encrypted at rest.

Encrypting data at rest reduces the risk that an unauthenticated user gets access to data that is stored on disk. ElastiCache for Redis replication groups should be encrypted at rest for an added layer of security.

## Remediation

To configure at-rest encryption on an ElastiCache for Redis replication group, see [Enabling at-rest encryption](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/at-rest-encryption.html#at-rest-encryption-enable) in the Amazon ElastiCache User Guide.
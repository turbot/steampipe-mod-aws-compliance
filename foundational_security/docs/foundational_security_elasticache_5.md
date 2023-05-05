## Description

This control checks if ElastiCache for Redis replication groups are encrypted in transit. This control fails if an ElastiCache for Redis replication group isn't encrypted in transit.

Encrypting data in transit reduces the risk that an unauthorized user can eavesdrop on network traffic. Enabling encryption in transit on an ElastiCache for Redis replication group encrypts your data whenever it's moving from one place to another, such as between nodes in your cluster or between your cluster and your application.

## Remediation

To configure in-transit encryption on an ElastiCache for Redis replication group, see [Enabling in-transit encryption](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/in-transit-encryption.html) in the Amazon ElastiCache User Guide.
## Description

This control checks if ElastiCache for Redis replication groups have Redis AUTH enabled. The control fails for an ElastiCache for Redis replication group if the Redis version of its nodes is below 6.0 and `AuthToken` isn't in use.

When you use Redis authentication tokens, or passwords, Redis requires a password before allowing clients to run commands, which improves data security. For Redis 6.0 and later versions, we recommend using Role-Based Access Control (RBAC). Since RBAC is not supported for Redis versions earlier than 6.0, this control only evaluates versions which can't use the RBAC feature.

## Remediation

To use Redis AUTH on an ElastiCache for Redis replication group, see [Modifying the AUTH token on an existing ElastiCache for Redis cluster](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/auth.html#auth-modifyng-token) in the Amazon ElastiCache User Guide.
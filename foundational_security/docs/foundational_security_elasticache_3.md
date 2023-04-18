## Description

This control checks if ElastiCache for Redis replication groups have automatic failover enabled. This control fails if automatic failover isn't enabled for a Redis replication group.

When automatic failover is enabled for a replication group, the role of primary node will automatically fail over to one of the read replicas. This failover and replica promotion ensure that you can resume writing to the new primary after promotion is complete, which reduces overall downtime in case of failure.

## Remediation

To enable automatic failover for an existing ElastiCache for Redis replication group,, see [Modifying an ElastiCache cluster](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Modify.html#Clusters.Modify.CON) in the Amazon ElastiCache User Guide. If you use the ElastiCache console, set `Auto failover` to enabled.
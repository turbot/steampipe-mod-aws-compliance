## Description

This control checks if ElastiCache clusters are configured with a custom subnet group. The control fails for an ElastiCache cluster if `CacheSubnetGroupName` has the value `default`.

When launching an ElastiCache cluster, a default subnet group is created if one doesn't exist already. The default group uses subnets from the default Virtual Private Cloud (VPC). We recommend using custom subnet groups that are more restrictive of the subnets that the cluster resides in, and the networking that the cluster inherits from the subnets.

## Remediation

To create a new subnet group for an ElastiCache cluster, see [Creating a subnet group](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/SubnetGroups.Creating.html) in the Amazon ElastiCache User Guide.
## Description

This control evaluates whether ElastiCache for Redis automatically applies minor version upgrades to cache clusters. This control fails if ElastiCache for Redis cache clusters do not have minor version upgrades automatically applied.

`AutoMinorVersionUpgrade` is a feature that you can turn on in ElastiCache for Redis to have your cache clusters automatically upgraded when a new minor cache engine version is available. These upgrades might include security patches and bug fixes. Staying up-to-date with patch installation is an important step in securing systems.

## Remediation

For instructions on turning on automatic minor version upgrades for an existing ElastiCache for Redis cache cluster, see [Upgrading engine versions](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/VersionManagement.html) in the Amazon ElastiCache User Guide.
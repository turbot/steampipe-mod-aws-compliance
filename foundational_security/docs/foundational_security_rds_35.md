## Description

This control checks if automatic minor version upgrade is enabled for an Amazon RDS database cluster. The control fails if automatic minor version upgrade isn't enabled for an RDS cluster.

RDS provides automatic minor version upgrade so that you can keep your RDS database cluster up to date. Minor versions can introduce new software features, bug fixes, security patches, and performance improvements. By enabling automatic minor version upgrade on RDS database clusters, the cluster, along with the instances in the cluster, will receive automatic updates to the minor version when new versions are available. The updates are applied automatically during the maintenance window.

## Remediation

To enable automatic minor version upgrade on RDS database clusters, see [Modifying the DB cluster by using the console, CLI, and API](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Modifying.html#Aurora.Modifying.Cluster) in the Amazon Aurora User Guide.
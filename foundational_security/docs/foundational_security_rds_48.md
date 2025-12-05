## Description

This control checks whether an Amazon RDS for MySQL DB cluster is configured to automatically copy tags to snapshots of the DB cluster when the snapshots are created. The control fails if the CopyTagsToSnapshot parameter is set to false for the RDS for MySQL DB cluster.

Copying tags to DB snapshots helps maintain proper resource tracking, governance, and cost allocation across backup resources. This enables consistent resource identification, access control, and compliance monitoring across both active databases and their snapshots. Properly tagged snapshots improve security operations by ensuring backup resources inherit the same metadata as their source databases.

## Remediation

For information about configuring an Amazon RDS for MySQL DB cluster to automatically copy tags to DB snapshots, see [Tagging Amazon RDS resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html) in the Amazon Relational Database Service User Guide.
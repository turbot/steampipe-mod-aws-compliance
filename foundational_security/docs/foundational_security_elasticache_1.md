## Description

This control evaluates if Amazon ElastiCache for Redis clusters have automatic backup scheduled. The control fails if the `SnapshotRetentionLimit` for the Redis cluster is less than `1`.

Amazon ElastiCache for Redis clusters can back up their data. You can use the backup to restore a cluster or seed a new cluster. The backup consists of the cluster's metadata, along with all of the data in the cluster. All backups are written to Amazon Simple Storage Service (Amazon S3), which provides durable storage. You can restore your data by creating a new Redis cluster and populating it with data from a backup. You can manage backups using the AWS Management Console, the AWS Command Line Interface (AWS CLI), and the ElastiCache API.

## Remediation

For information about scheduling automatic backups, see [Scheduling Automatic Backups](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/backups-automatic.html) in the Amazon ElastiCache User Guide.
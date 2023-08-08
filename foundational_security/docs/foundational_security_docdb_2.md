## Description

This control checks whether an Amazon DocumentDB cluster has a backup retention period greater than or equal to 7 days. The control fails if the backup retention period is less than 7 days.

Backups help you recover more quickly from a security incident and strengthen the resilience of your systems. By automating backups for your Amazon DocumentDB clusters, you'll be able to restore your systems to a point in time and minimize downtime and data loss. Amazon DocumentDB clusters have a default backup retention period of 1 day, which should be increased to 7 days to pass this control.

## Remediation

To change the backup retention period for your Amazon DocumentDB clusters, see [Modifying an Amazon DocumentDB Cluster](https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-modify.html) in the Amazon DocumentDB Developer Guide. For Backup, choose a value greater than or equal to 7.
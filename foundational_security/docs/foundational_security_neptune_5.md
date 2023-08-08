## Description

This control checks whether a Neptune DB cluster has automated backups enabled, and a backup retention period greater than or equal to 7 days. The control fails if backups aren't enabled for the Neptune DB cluster, or if the retention period is less than 7 days.

Backups help you recover more quickly from a security incident and strengthen the resilience of your systems. By automating backups for your Neptune DB clusters, you'll be able to restore your systems to a point in time and minimize downtime and data loss.

## Remediation

To enable automated backups and set a retention period for your Neptune DB clusters, see [Enabling automated backups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.Enabling) in the Amazon RDS User Guide. For Backup retention period, choose a value greater than or equal to 7.
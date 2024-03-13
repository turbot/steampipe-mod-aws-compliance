## Description

This control checks whether an Amazon DocumentDB manual cluster snapshot is public. The control fails if the manual cluster snapshot is public.

An Amazon DocumentDB manual cluster snapshot should not be public unless intended. If you share an unencrypted manual snapshot as public, the snapshot is available to all AWS accounts. Public snapshots may result in unintended data exposure.

## Remediation

To remove public access for Amazon DocumentDB manual cluster snapshots, see [Sharing a snapshot](https://docs.aws.amazon.com/documentdb/latest/developerguide/backup_restore-share_cluster_snapshots.html#backup_restore-share_snapshots) in the Amazon DocumentDB Developer Guide. Programmatically, you can use the Amazon DocumentDB operation modify-db-snapshot-attribute. Set attribute-name as restore and values-to-remove as all.
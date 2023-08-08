## Description

This control checks whether a Neptune manual DB cluster snapshot is public. The control fails if a Neptune manual DB cluster snapshot is public.

A Neptune DB cluster manual snapshot should not be public unless intended. If you share an unencrypted manual snapshot as public, the snapshot is available to all AWS accounts. Public snapshots may result in unintended data exposure.

## Remediation

To remove public access for Neptune manual DB cluster snapshots, see [Sharing a DB cluster snapshot](https://docs.aws.amazon.com/neptune/latest/userguide/backup-restore-share-snapshot.html) in the Neptune User Guide.

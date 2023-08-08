## Description

This control checks if a Neptune DB cluster is configured to copy all tags to snapshots when the snapshots are created. The control fails if a Neptune DB cluster isn't configured to copy tags to snapshots.

Identification and inventory of your IT assets is a crucial aspect of governance and security. You should tag snapshots in the same way as their parent Amazon RDS database clusters. Copying tags ensures that the metadata for the DB snapshots matches that of the parent database clusters, and that access policies for the DB snapshot also match those of the parent DB instance.

## Remediation

To copy tags to snapshots for Neptune DB clusters, see [Copying tags in Neptune](https://docs.aws.amazon.com/neptune/latest/userguide/tagging.html#tagging-overview) in the Neptune User Guide.
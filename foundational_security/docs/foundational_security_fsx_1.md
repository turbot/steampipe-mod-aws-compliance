## Description

This control checks if an Amazon FSx for OpenZFS file system is configured to copy tags to backups and volumes. The control fails if the OpenZFS file system isn't configured to copy tags to backups and volumes.

Identification and inventory of your IT assets is an important aspect of governance and security. Tags help you categorize your AWS resources in different ways, for example, by purpose, owner, or environment. This is useful when you have many resources of the same type because you can quickly identify a specific resource based on the tags that you assigned to it.

## Remediation

To configure an FSx for OpenZFS file system to copy tags to backups and volumes, see [Updating a file system](https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/updating-file-system.html) in the Amazon FSx OpenZFS User Guide.
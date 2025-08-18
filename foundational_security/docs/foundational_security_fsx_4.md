## Description

This control checks whether an Amazon FSx for NetApp ONTAP file system is configured to use a multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use a Multi-AZ deployment type. You can optionally specify a list of deployment types to include in the evaluation.

Amazon FSx for NetApp ONTAP supports several deployment types for file systems: Single-AZ 1, Single-AZ 2, Multi-AZ 1, and Multi-AZ 2. The deployment types offer different levels of availability and durability. We recommend using a Multi-AZ deployment type for most production workloads due to the high availability and durability model that Multi-AZ deployment types provide. Multi-AZ file systems support all the availability and durability features of Single-AZ file systems. In addition, they're designed to provide continuous availability to data even when an Availability Zone (AZ) is unavailable.

## Remediation

You can't change the deployment type for an existing Amazon FSx for NetApp ONTAP file system. However, you can back up the data, and then restore it on a new file system that uses a Multi-AZ deployment type.

For information about deployment types and options for FSx for ONTAP file systems, see [Availability, durability, and deployment options](https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/high-availability-AZ.html)and [Managing file systems](https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-file-systems.html) in the FSx for ONTAP User Guide.
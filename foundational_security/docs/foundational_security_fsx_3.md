## Description

This control checks whether an Amazon FSx for OpenZFS file system is configured to use the multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use the Multi-AZ deployment type.

Amazon FSx for OpenZFS supports several deployment types for file systems: Multi-AZ (HA), Single-AZ (HA), and Single-AZ (non-HA). The deployment types offer different levels of availability and durability. Multi-AZ (HA) file systems are composed of a high-availability (HA) pair of file servers that are spread across two Availability Zones (AZs). We recommend using the Multi-AZ (HA) deployment type for most production workloads due to the high availability and durability model that it provides.

## Remediation

You can configure an Amazon FSx for OpenZFS file system to use the Multi-AZ deployment type when you create the file system. You can't change the deployment type for an existing FSx for OpenZFS file system.

For information about deployment types and options for FSx for OpenZFS file systems, see [Availability and durability for Amazon FSx for OpenZFS](https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/availability-durability.html) and [Managing file system resources](https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/managing-file-systems.html) in the Amazon FSx for OpenZFS User Guide.
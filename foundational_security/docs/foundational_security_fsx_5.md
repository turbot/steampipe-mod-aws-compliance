## Description

This control checks whether an Amazon FSx for Windows File Server file system is configured to use the multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use the Multi-AZ deployment type.

Amazon FSx for Windows File Server supports two deployment types for file systems: Single-AZ and Multi-AZ. The deployment types offer different levels of availability and durability. Single-AZ file systems are composed of a single Windows file server instance and a set of storage volumes within a single Availability Zone (AZ). Multi-AZ file systems are composed of a high-availability cluster of Windows file servers spread across two Availability Zones. We recommend using the Multi-AZ deployment type for most production workloads due to the high availability and durability model that it provides.

## Remediation

You can configure an Amazon FSx for Windows File Server file system to use the Multi-AZ deployment type when you create the file system. You can't change the deployment type for an existing FSx for Windows File Server file system.

For information about deployment types and options for FSx for Windows File Server file systems, see [Availability and durability: Single-AZ and Multi-AZ file systems](https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/high-availability-AZ.html) and [Getting started with Amazon FSx for Windows File Server](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/getting-started.html) in the Amazon FSx for Windows File Server User Guide.
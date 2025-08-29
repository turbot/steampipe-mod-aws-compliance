## Description

This control checks whether an Amazon EFS mount target is associated with subnets that assign public IP addresses on launch. The control fails if the mount target is associated with subnets that assign public IP addresses on launch.

All subnets have an attribute that determines whether a network interface created in the subnet automatically receives a public IPv4 address. Amazon EFS mount targets that are launched into subnets that have this attribute enabled have a public IP address assigned to their primary network interface.

## Remediation

To associate an existing mount target with a different subnet, you must create a new mount target in a subnet that does not assign public IP addresses on launch and then remove the old mount target. For information about managing mount targets, see [Creating and managing mount targets and security groups](https://docs.aws.amazon.com/efs/latest/ug/accessing-fs.html) in the Amazon Elastic File System User Guide.
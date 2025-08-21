## Description

This control checks whether source/destination checking is enabled for an Amazon EC2 elastic network interface (ENI) that's managed by users. The control fails if source/destination checking is disabled for the user-managed ENI. This control checks only the following types of ENIs: aws_codestar_connections_managed, branch, efa, interface, lambda, and quicksight.

Source/destination checking for Amazon EC2 instances and attached ENIs should be enabled and configured consistently across your EC2 instances. Each ENI has its own setting for source/destination checks. If source/destination checking is enabled, Amazon EC2 enforces source/destination address validation, which ensures that an instance is either the source or the destination of any traffic that it receives. This provides an additional layer of network security by preventing resources from handling unintended traffic and preventing IP address spoofing.

## Remediation

For information about enabling source/destination checks for an Amazon EC2 ENI, see [Modify network interface attributes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/modify-network-interface-attributes.html#modify-source-dest-check) in the Amazon EC2 User Guide.
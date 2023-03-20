## Description

This control checks if Amazon EC2 launch templates are configured to assign public IP addresses to network interfaces upon launch. The control fails if an EC2 launch template is configured to assign a public IP address to network interfaces or if there is at least one network interface that has a public IP address.

A public IP address is one that is reachable from the internet. If you configure your network interfaces with a public IP address, then the resources associated with those network interfaces may be reachable from the internet. EC2 resources shouldn't be publicly accessible because this may permit unintended access to your workloads.

## Remediation

To update an EC2 launch template, see [Change the default network interface settings](https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html#change-network-interface) in the Amazon EC2 Auto Scaling User Guide.

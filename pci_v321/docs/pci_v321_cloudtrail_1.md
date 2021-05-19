## Description

This control checks whether your Auto Scaling groups that are associated with a load balancer are using Elastic Load Balancing health checks.

PCI DSS does not require load balancing or highly available configurations. However, this check aligns with AWS best practices.

## Remediation

To enable Elastic Load Balancing health checks

1. Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.
1. On the navigation pane, under Auto Scaling, choose Auto Scaling Groups.
1. To select the group from the list, choose the right box.
1. From Actions, choose Edit
1. For Health Check Type, choose ELB.
1. For Health Check Grace Period, enter 300.
1. Choose Save.

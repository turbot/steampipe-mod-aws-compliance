## Description

Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH to port `22` and RDP to port `3389`.

Public access to remote server administration ports, such as 22 and 3389, increases resource attack surface and unnecessarily raises the risk of resource compromise.

## Remediation

Perform the following to implement the prescribed state:

1. Login to the AWS Management Console at https://console.aws.amazon.com/vpc/home.
2. In the left pane, click `Security Groups`.
3. For each security group to remediate, perform the following:
4. Select the respective security group.
5. Choose the `Inbound Rules` tab.
6. Click `Edit Inbound rules` button.
7. Identify the rules to be edited or removed.
8. Either A) update the Source field to a range other than ::/0, or, B) Click `Delete` the offending inbound rule.
9. Click `Save rules`.

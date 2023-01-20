## Description

Security groups provide stateful filtering of ingress/egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to port 22.

Removing unfettered connectivity to remote console services, such as SSH, reduces a server's exposure to risk.

## Remediation

Perform the following to implement the prescribed state:

1. Login to the [AWS Management Console](https://console.aws.amazon.com/vpc/home).
2. In the left pane, click `Security Groups`.
3. For each security group, perform the following:
4. Select the security group.
5. Click the `Inbound Rule`s tab.
6. Identify the rules to be removed.
7. Click the x in the `Remove` column.
8. Click `Save`.

## Description

This control checks if default ports for SSH/RDP ingress traffic for network access control lists (NACLs) is unrestricted. The rule fails if a NACL inbound entry allows a source CIDR block of '0.0.0.0/0' or '::/0' for ports 22 or 3389

Access to remote server administration ports, such as port 22 (SSH) and port 3389 (RDP), should not be publicly accessible, as this may allow unintended access to resources within your VPC.

## Remediation

For more information about NACLs, see [Network ACLs](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html) in the VPC User Guide.
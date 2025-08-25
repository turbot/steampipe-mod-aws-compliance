## Description

This control checks whether a security group associated with an Amazon Redshift cluster has ingress rules that permit access to the cluster port from the internet (0.0.0.0/0 or ::/0). The control fails if the security group ingress rules permit access to the cluster port from the internet.

Permitting unrestricted inbound access to the Redshift cluster port (IP address with a /0 suffix) can result in unauthorized access or security incidents. We recommend applying the principal of least privilege access when creating security groups and configuring inbound rules.

## Remediation

To restrict ingress on the Redshift cluster port to restricted origins, see [Work with security group rules](https://docs.aws.amazon.com/vpc/latest/userguide/security-group-rules.html#working-with-security-group-rules) in the Amazon VPC User Guide. Update rules where the port range matches the Redshift cluster port and the IP port range is 0.0.0.0/0.
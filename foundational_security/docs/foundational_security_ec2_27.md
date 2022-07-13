## Description

This control checks whether running EC2 instances are using key pairs. The control fails if a running EC2 instance uses a key pair.

As best practice, we recommend that you reduce the number of credentials in use whenever possible to minimize the risk of compromised credentials and unintended access. EC2 instances without key pairs can still be accessed using AWS Systems Manager Session Manager or browser-based SSH connection via the AWS console. You can also access EC2 instances with a password, but we do not recommend this because it involves credentials similar to key pairs.

## Remediation

To delete a key pair, see [Delete your public key on Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/delete-key-pair.html) in the Amazon EC2 User Guide for Linux Instances.
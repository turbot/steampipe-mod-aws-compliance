## Description

This control checks whether GuardDuty Malware Protection is enabled. For a standalone account, the control fails if GuardDuty Malware Protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have Malware Protection enabled.

In a multi-account environment, the control generates findings in only the delegated GuardDuty administrator account. Only the delegated administrator can enable or disable the Malware Protection feature for the member accounts in the organization. GuardDuty member accounts can't modify this configuration from their accounts. This control generates FAILED findings if the delegated GuardDuty administrator has a suspended member account that doesn't have GuardDuty Malware Protection enabled. To receive a PASSED finding, the delegated administrator must disassociate these suspended accounts in GuardDuty.

GuardDuty Malware Protection for EC2 helps you detect the potential presence of malware by scanning the Amazon Elastic Block Store (Amazon EBS) volumes that are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances and container workloads. Malware Protection provides scan options where you can decide if you want to include or exclude specific EC2 instances and container workloads at the time of scanning. It also provides an option to retain the snapshots of EBS volumes attached to the EC2 instances or container workloads, in your GuardDuty accounts. The snapshots get retained only when malware is found and Malware Protection findings are generated.

## Remediation

To enable GuardDuty Malware Protection for EC2, see [Configuring GuardDuty-initiated malware scan](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html) in the Amazon GuardDuty User Guide.




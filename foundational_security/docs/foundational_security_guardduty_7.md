## Description

This control checks whether GuardDuty EKS Runtime Monitoring with automated agent management is enabled. For a standalone account, the control fails if GuardDuty EKS Runtime Monitoring with automated agent management is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have EKS Runtime Monitoring with automated agent management enabled.

In a multi-account environment, the control generates findings in only the delegated GuardDuty administrator account. Only the delegated administrator can enable or disable the EKS Runtime Monitoring feature with automated agent management for the member accounts in the organization. GuardDuty member accounts can't modify this configuration from their accounts. This control generates FAILED findings if the delegated GuardDuty administrator has a suspended member account that doesn't have GuardDuty EKS Runtime Monitoring enabled. To receive a PASSED finding, the delegated administrator must disassociate these suspended accounts in GuardDuty.

EKS Protection in Amazon GuardDuty provides threat detection coverage to help you protect Amazon EKS clusters within your AWS environment. EKS Runtime Monitoring uses operating system-level events to help you detect potential threats in EKS nodes and containers within your EKS clusters.

## Remediation

To enable EKS Runtime Monitoring with automated agent management, see [Enabling GuardDuty Runtime Monitoring](https://docs.aws.amazon.com/guardduty/latest/ug/runtime-monitoring-configuration.html) in the Amazon GuardDuty User Guide.




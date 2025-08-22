## Description

This control checks whether GuardDuty EKS Audit Log Monitoring is enabled. For a standalone account, the control fails if GuardDuty EKS Audit Log Monitoring is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have EKS Audit Log Monitoring enabled.

In a multi-account environment, the control generates findings in only the delegated GuardDuty administrator account. Only the delegated administrator can enable or disable the EKS Audit Log Monitoring feature for the member accounts in the organization. GuardDuty member accounts can't modify this configuration from their accounts. This control generates FAILED findings if the delegated GuardDuty administrator has a suspended member account that doesn't have GuardDuty EKS Audit Log Monitoring enabled. To receive a PASSED finding, the delegated administrator must disassociate these suspended accounts in GuardDuty.

GuardDuty EKS Audit Log Monitoring helps you detect potentially suspicious activities in your Amazon Elastic Kubernetes Service (Amazon EKS) clusters. EKS Audit Log Monitoring uses Kubernetes audit logs to capture chronological activities from users, applications using the Kubernetes API, and the control plane.

## Remediation

To enable GuardDuty EKS Audit Log Monitoring, see [EKS Audit Log Monitoring](https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html) in the Amazon GuardDuty User Guide.
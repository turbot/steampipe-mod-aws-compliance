## Description

This control checks whether Amazon Inspector Lambda standard scanning is enabled. For a standalone account, the control fails if Amazon Inspector Lambda standard scanning is disabled in the account. In a multi-account environment, the control fails if the delegated Amazon Inspector administrator account and all member accounts don't have Lambda standard scanning enabled.

In a multi-account environment, the control generates findings in only the delegated Amazon Inspector administrator account. Only the delegated administrator can enable or disable the Lambda standard scanning feature for the member accounts in the organization. Amazon Inspector member accounts can't modify this configuration from their accounts. This control generates FAILED findings if the delegated administrator has a suspended member account that doesn't have Amazon Inspector Lambda standard scanning enabled. To receive a PASSED finding, the delegated administrator must disassociate these suspended accounts in Amazon Inspector.

Amazon Inspector Lambda standard scanning identifies software vulnerabilities in the application package dependencies you add to your AWS Lambda function code and layers. If Amazon Inspector detects a vulnerability in your Lambda function application package dependencies, Amazon Inspector produces a detailed Package Vulnerability type finding. You can activate Lambda code scanning together with Lambda standard scanning (see [[Inspector.3] Amazon Inspector Lambda code scanning should be enabled](https://docs.aws.amazon.com/securityhub/latest/userguide/inspector-controls.html#inspector-3)).

## Remediation

To enable Amazon Inspector Lambda standard scanning, see [Activating scans](https://docs.aws.amazon.com/inspector/latest/user/activate-scans.html#activate-scans-proc) in the Amazon Inspector User Guide.
## Description

This control checks whether Amazon Inspector Lambda code scanning is enabled. For a standalone account, the control fails if Amazon Inspector Lambda code scanning is disabled in the account. In a multi-account environment, the control fails if the delegated Amazon Inspector administrator account and all member accounts don't have Lambda code scanning enabled.

In a multi-account environment, the control generates findings in only the delegated Amazon Inspector administrator account. Only the delegated administrator can enable or disable the Lambda code scanning feature for the member accounts in the organization. Amazon Inspector member accounts can't modify this configuration from their accounts. This control generates FAILED findings if the delegated administrator has a suspended member account that doesn't have Amazon Inspector Lambda code scanning enabled. To receive a PASSED finding, the delegated administrator must disassociate these suspended accounts in Amazon Inspector.

Amazon Inspector Lambda code scanning scans the custom application code within an AWS Lambda function for code vulnerabilities based on AWS security best practices. Lambda code scanning can detect injection flaws, data leaks, weak cryptography, or missing encryption in your code. This feature is available in [specific AWS Regions only](https://docs.aws.amazon.com/inspector/latest/user/inspector_regions.html#ins-regional-feature-availability). You can activate Lambda code scanning together with Lambda standard scanning (see [[Inspector.4] Amazon Inspector Lambda standard scanning should be enabled](https://docs.aws.amazon.com/securityhub/latest/userguide/inspector-controls.html#inspector-4)).

## Remediation

To enable Amazon Inspector Lambda code scanning, see [Activating scans](https://docs.aws.amazon.com/inspector/latest/user/activate-scans.html#activate-scans-proc) in the Amazon Inspector User Guide.
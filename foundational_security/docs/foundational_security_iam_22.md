## Description

This control checks whether IAM roles have policies that allow write access to resources in other AWS accounts. Such policies can pose a security risk as they may allow unauthorized access to resources in other accounts.

The control specifically checks for:
1. Policies that allow access from any AWS account (Principal: {"AWS": "*"})
2. Policies that include write actions (e.g., s3:PutObject, dynamodb:PutItem, etc.)
3. Policies that include wildcard actions ("*") or specific write actions for various AWS services

## Remediation

To remediate this issue:
1. Review the IAM roles identified by this control
2. Modify the role policies to:
   - Restrict the Principal to specific AWS account IDs that need access
   - Limit the actions to only those that are necessary
   - Use resource-level permissions to restrict access to specific resources
3. Consider using AWS Organizations and Service Control Policies (SCPs) to enforce account-level restrictions
4. Implement the principle of least privilege by granting only the minimum permissions required

## Additional Information

- [AWS IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [IAM JSON Policy Elements: Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html)
- [IAM JSON Policy Elements: Action](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_action.html) 
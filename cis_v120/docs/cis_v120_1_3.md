## Description

AWS IAM users can access AWS resources using different types of credentials, such as passwords or access keys. It is recommended that all credentials that have been unused in 90 or greater days be removed or deactivated.

Disabling or removing unnecessary credentials will reduce the window of opportunity for credentials associated with a compromised or abandoned account to be used.

## Remediation

Perform the following to remove or deactivate credentials:

1. Login to the AWS Management Console:
2. Click `Services`.
3. Click `IAM`.
4. Click on `Users`.
5. Click on `Security Credentials`.
6. As an Administrator.
  - Click on `Make Inactive` for credentials that have not been used in `90` Days.
7. As an IAM User.
  - Click on `Make Inactive` or `Delete` for credentials which have not been used in `90` Days.

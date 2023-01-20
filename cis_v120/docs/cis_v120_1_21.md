## Description

AWS console defaults the checkbox for creating access keys to enabled. This results in many access keys being generated unnecessarily. In addition to unnecessary credentials, it also generates unnecessary management work in auditing and rotating these keys.

Requiring that additional steps be taken by the user after their profile has been created will give a stronger indication of intent that access keys are [a] necessary for their work and [b] once the access key is established on an account that the keys may be in use somewhere in the organization.

**Note**: Even if it is known the user will need access keys, require them to create the keys themselves or put in a support ticket to have the created as a separate step from user creation.

## Remediation

Perform the following to delete access keys that do not pass the audit:

1. Login to the AWS Management Console:
2. Click `Services`.
3. Click `IAM`.
4. Click on `Users`.
5. Click on `Security Credentials`.
6. As an Administrator
  - Click on `Delete` for keys that were created at the same time as the user profile but have not been used.
7. As an IAM User
  - Click on `Delete` for keys that were created at the same time as the user profile but have not been used.

### Via CLI

```bash
aws iam delete-access-key
```

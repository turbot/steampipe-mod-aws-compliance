## Description

AWS console defaults to no check boxes selected when creating a new IAM user. When creating the IAM User credentials you have to determine what type of access they require.

Programmatic access: The IAM user might need to make API calls, use the AWS CLI, or use the Tools for Windows PowerShell. In that case, create an access key (access key ID and a secret access key) for that user.

AWS Management Console access: If the user needs to access the AWS Management Console, create a password for the user.

Requiring the additional steps be taken by the user for programmatic access after their profile has been created will give a stronger indication of intent that access keys are [a] necessary for their work and [b] once the access key is established on an account that the keys may be in use somewhere in the organization.

**Note**: Even if it is known the user will need access keys, require them to create the keys themselves or put in a support ticket to have them created as a separate step from user creation.

## Remediation

Perform the following to delete access keys that do not pass the audit:

### From Console:

1. Log into the AWS Management Console:
2. Click `Services`.
3. Click `IAM`.
4. Click on `Users`.
5. Click on `Security Credentials`.
6. As an Administrator
- Click on the X (`Delete`) for keys that were created at the same time as the user profile but have not been used.

7. As an IAM User
- Click on the X (`Delete`) for keys that were created at the same time as the user profile but have not been used.

### From Command Line:

```bash
aws iam delete-access-key --access-key-id <access-key-id-listed> --user-name <users-name>
```

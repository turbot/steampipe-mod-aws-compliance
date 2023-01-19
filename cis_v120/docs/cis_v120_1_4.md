## Description

Access keys consist of an access key ID and secret access key, which are used to sign programmatic requests that you make to AWS. AWS users need their own access keys to make programmatic calls to AWS from the AWS Command Line Interface (AWS CLI), Tools for Windows PowerShell, the AWS SDKs, or direct HTTP calls using the APIs for individual AWS services. It is recommended that all access keys be regularly rotated.

Rotating access keys will reduce the window of opportunity for an access key that is associated with a compromised or terminated account to be used.
Access keys should be rotated to ensure that data cannot be accessed with an old key which might have been lost, cracked, or stolen.

## Remediation

Perform the following to rotate access keys:

1. Login to the AWS Management Console:
2. Click `Services`.
3. Click `IAM`.
4. Click on `Users`.
5. Click on `Security Credentials`.
6. As an Administrator
  - Click on `Make Inactive` for keys that have not been rotated in `90` Days.
7. As an IAM User
  - Click on `Make Inactive` or `Delete` for keys which have not been rotated or used in `90` Days.
8. Click on `Create Access Key`.
9. Update programmatic call with new Access Key credentials.

### Via CLI

```bash
aws iam update-access-key
aws iam create-access-key
aws iam delete-access-key
```

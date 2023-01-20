## Description

The root account is the most privileged user in an AWS account. AWS Access Keys provide programmatic access to a given AWS account. It is recommended that all access keys associated with the root account be removed.

Removing access keys associated with the root account limits vectors by which the account can be compromised. Additionally, removing the root access keys encourages the creation and use of role based accounts that are least privileged.

## Remediation

Perform the following to delete or disable active root access keys being

### Via the AWS Console

Perform the following action to disable user console password:

1. Sign in to the AWS Management Console as Root and open the [IAM console](https://console.aws.amazon.com/iam/).
2. Click on `<Root_Account_Name>` at the top right and select `Security Credentials` from the drop down list.
3. On the pop out screen Click on `Continue to Security Credentials`.
4. Click on `Access Keys` (Access Key ID and Secret Access Key).
5. Under the `Status` column if there are any Keys which are Active
  - Click on `Make Inactive` - (Temporarily disable Key - may be needed again).
  - Click `Delete` - (Deleted keys cannot be recovered).

## Description

AWS CloudShell is a convenient way of running CLI commands against AWS services; a managed IAM policy ('AWSCloudShellFullAccess') provides full access to CloudShell, which allows file upload and download capability between a user's local system and the CloudShell environment. Within the CloudShell environment a user has sudo permissions, and can access the internet. So it is feasible to install file transfer software (for example) and move data from CloudShell to external internet servers.

Access to this policy should be restricted as it presents a potential channel for data exfiltration by malicious cloud admins that are given full permissions to the service. AWS documentation describes how to create a more restrictive IAM policy which denies file transfer permissions.

## Remediation

### From Console:

1. Open the IAM console at https://console.aws.amazon.com/iam/.
2. In the left pane, select Policies.
3. Search for and select AWS CloudShellFullAccess.
4. On the Entities attached tab, for each item, check the box and select Detach.
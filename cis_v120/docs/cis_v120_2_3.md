## Description

CloudTrail logs a record of every API call made in your AWS account. These logs file are stored in an S3 bucket. It is recommended that the bucket policy, or access control list (ACL), applied to the S3 bucket that CloudTrail logs to prevents public access to the CloudTrail logs.

Allowing public access to CloudTrail log content may aid an adversary in identifying weaknesses in the affected account's use or configuration.

## Remediation

Perform the following to remove any public access that has been granted to the bucket via an ACL or S3 bucket policy:

1. Go to [Amazon S3 console](https://console.aws.amazon.com/s3/home).
2. Right-click on the bucket and click Properties.
3. In the `Properties` pane, click the `Permissions` tab.
4. The tab shows a list of grants, one row per grant, in the bucket ACL. Each row identifies the grantee and the permissions granted.
5. Select the row that grants permission to Everyone or `Any Authenticated User`.
6. Uncheck all the permissions granted to `Everyone` or `Any Authenticated User` (click `x` to delete the row).
7. Click `Save` to save the ACL.
8. If the `Edit bucket policy` button is present, click it.
9. Remove any `Statement` having an `Effect` set to `Allow` and a `Principal` set to `"*"` or `{"AWS" : "*"}`.

**Default Value**: By default, S3 buckets are not publicly accessible.

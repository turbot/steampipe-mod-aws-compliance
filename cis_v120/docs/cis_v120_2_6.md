## Description

S3 Bucket Access Logging generates a log that contains access records for each request made to your S3 bucket. An access log record contains details about the request, such as the request type, the resources specified in the request worked, and the time and date the request was processed. It is recommended that bucket access logging be enabled on the CloudTrail S3 bucket.

By enabling S3 bucket logging on target S3 buckets, it is possible to capture all events which may affect objects within an target buckets. Configuring logs to be placed in a separate bucket allows access to log information which can be useful in security and incident response workflows.

## Remediation

Perform the following to enable S3 bucket logging:

### Via the Management Console

1. Sign in to the AWS Management Console and open the [S3 console](https://console.aws.amazon.com/s3).
2. Under `All Buckets` click on the target S3 bucket.
3. Click on `Properties` in the top right of the console.
4. Under `Bucket`: `<s3_bucket_for_cloudtrail>` click on `Logging`.
5. Configure bucket logging
  - Click on `Enabled` checkbox.
  - Select Target Bucket from list.
  - Enter a Target Prefix.
6. Click `Save`.

**Default Value**: Logging is disabled.

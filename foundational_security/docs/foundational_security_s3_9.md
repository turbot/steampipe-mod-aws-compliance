## Description

When logging is enabled, Amazon S3 delivers access logs for a source bucket to a chosen target bucket. The target bucket must be in the same AWS Region as the source bucket and must not have a default retention period configuration. The target logging bucket does not need to have logging enabled. This control passes if Server access logging is enabled.

Server access logging provides detailed records of requests made to a bucket. Server access logs can assist in security and access audits. For more information, see Security Best Practices for Amazon S3: Enable Amazon S3 server access logging.

## Remediation

**To enable S3 bucket access logging**

1. Sign in to the AWS Management Console and open the [Amazon S3 console](https://console.aws.amazon.com/s3/).
2. Choose the bucket used for CloudTrail.
3. Choose `Properties`.
4. Choose `Server access logging`, then select `Edit`.
5. Under `Server access logging` choose `Enable` then choose `Save changes`.
## Description

This control checks whether lifecycle rules are configured for an S3 directory bucket. The control fails if lifecycle rules aren't configured for the directory bucket, or a lifecycle rule for the bucket specifies expiration settings that don't match the parameter value that you optionally specify.

In Amazon S3, a lifecycle configuration is a set of rules that define actions for Amazon S3 to apply to a group of objects in a bucket. For an S3 directory bucket, you can create a lifecycle rule that specifies when objects expire based on age (in days). You can also create a lifecycle rule that deletes incomplete multipart uploads. Unlike other types of S3 buckets, such as general purpose buckets, directory buckets do not support other types of actions for lifecycle rules, such as transitioning objects between storage classes.

## Remediation

To define a lifecycle configuration for an S3 directory bucket, create a lifecycle rule for the bucket. For more information, see [Creating and managing a lifecycle configuration for your directory bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-create-lc.html) in the Amazon Simple Storage Service User Guide

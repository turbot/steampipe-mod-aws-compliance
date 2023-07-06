## Description

Amazon S3 provides `Block public access (bucket settings)` and `Block public access (account settings)` to help you manage public access to Amazon S3 resources. By default, S3 buckets and objects are created with public access disabled. However, an IAM principal with sufficient S3 permissions can enable public access at the bucket and/or object level. While enabled, `Block public access (bucket settings)` prevents an individual bucket, and its contained objects, from becoming publicly accessible. Similarly, `Block public access (account settings)` prevents all buckets, and contained objects, from becoming publicly accessible across the entire account.

Amazon S3 `Block public access (bucket settings)` prevents the accidental or malicious public exposure of data contained within the respective bucket(s).

Amazon S3 `Block public access (account settings)` prevents the accidental or malicious public exposure of data contained within all buckets of the respective AWS account.

Whether blocking public access to all or some buckets is an organizational decision that should be based on data sensitivity, least privilege, and use case.

## Remediation

### If utilizing Block Public Access (bucket settings)

### From Console:

1. Login to AWS Management Console and open the Amazon S3 console using https://console.aws.amazon.com/s3/.
2. Select the Check box next to the Bucket.
3. Click on 'Edit public access settings'.
4. Click 'Block all public access'.
5. Repeat for all the buckets in your AWS account that contain sensitive data.

### From Command Line:

1. List all of the S3 Buckets

```bash
aws s3 ls
```

2. Set the public access to true on that bucket

```bash
aws s3api put-public-access-block --bucket <name-of-bucket> --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

### If utilizing Block Public Access (account settings)

### From Console:

If the output reads `true` for the separate configuration settings then it is set on the account.

1. Login to AWS Management Console and open the Amazon S3 console using https://console.aws.amazon.com/s3/.
2. Choose `Block Public Access (account settings)`.
3. Choose `Edit` to change the block public access settings for all the buckets in your AWS account.
4. Choose the settings you want to change, and then choose `Save`. For details about each setting, pause on the `i` icons.
5. When you're asked for confirmation, enter `confirm`. Then Click `Confirm` to save your changes.

### From Command Line:

To set Block Public access settings for the account, run the following command:

```bash
aws s3control put-public-access-block --public-access-block-configuration BlockPublicAcls=true, IgnorePublicAcls=true, BlockPublicPolicy=true, RestrictPublicBuckets=true --account-id <value>
```

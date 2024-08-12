## Description

The following policy grants a user access to manage a specific bucket in the Amazon Lightsail object storage service.

This policy grants access to buckets through the Lightsail console, the AWS Command Line Interface (AWS CLI), AWS API, and AWS SDKs.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `IAM` under Security, Identity, & Compliance.
3. Click `Policies`.
4. Click `Create policy`.
5. Click on the JSON tab.
6. Copy and paste the policy below into the JSON editor replacing the text in there and filling in the Lightsail bucket names.

**You can find the Lightsail bucket name in the Lightsail console, Storage, Under buckets.**

```
{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "LightsailAccess",
"Effect": "Allow",
"Action": "lightsail:*",
"Resource": "*"
},
{
"Sid": "S3BucketAccess",
"Effect": "Allow",
"Action": "s3:*",
"Resource": [
"arn:aws:s3:::<BucketName>/*",
"arn:aws:s3:::<BucketName>"
]
}
]
}
```

7. Click `Next tags`.
8. Add tags based on your companies outlined Tagging policy that should be in place based on the AWS Foundations Benchmark.
9. Click `Next review`.
10. Click in `Name*` and give it a name that contains "Lightsail".
11. Review the summary.
12. Click `Create policy`.
13. Click in the `Filter policies by property or policy name and press enter`.
14. Type `Lightsail` and press enter.
15. Click on the Policy name that you just created.
16. Click on the `Policy usage` tab.
17. Click `Attach`.
18. Add in the Users or Group that should have this permission.
19. Click `Attach policy`.
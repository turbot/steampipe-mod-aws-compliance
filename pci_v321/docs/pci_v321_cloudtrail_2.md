## Description

This control checks whether CloudTrail is enabled in your AWS account.

However, some AWS services do not enable logging of all APIs and events. You should implement any additional audit trails other than CloudTrail and review the documentation for each service in CloudTrail Supported Services and Integrations.

## Remediation

To create a new trail in CloudTrail

1. Sign in to the AWS Management Console using the IAM user you configured for CloudTrail administration.
2. Open the CloudTrail console at [CloudTrail](https://console.aws.amazon.com/cloudtrail/).
3. In the Region selector, choose the AWS Region where you want your trail to be created. This is the Home Region for the trail.
4. The Home Region is the only AWS Region where you can view and update the trail after it is created, even if the trail logs events in all AWS Regions.
5. In the navigation pane, choose **Trails**.
6. On the Trails page, choose **Get Started Now**. If you do not see that option, choose **Create Trail**.
7. In Trail name, give your trail a name, such as My-Management-Events-Trail.
8. As a best practice, use a name that quickly identifies the purpose of the trail. In this case, you're creating a trail that logs management events.
9. In Management Events, make sure Read/Write events is set to **All**.
10. In Data Events, do not make any changes. This trail will not log any data events.
11. Create a new S3 bucket for the logs:
    1. In Storage Location, in Create a new S3 bucket, choose **Yes**.
    2. In S3 bucket, give your bucket a name, such as my-bucket-for-storing-cloudtrail-logs.
    3. The name of your S3 bucket must be globally unique. For more information about S3 bucket naming requirements, see the [AWS CloudTrail User Guide](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-s3-bucket-naming-requirements.html).
12. Under Advanced, choose **Yes** for both Encrypt log files with SSE-KMS and Enable log file validation.
13. Choose **Create**.
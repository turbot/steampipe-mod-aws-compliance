## Description

AWS Config is a web service that performs configuration management of supported AWS resources within your account and delivers log files to you. The recorded information includes the configuration item (AWS resource), relationships between configuration items (AWS resources), any configuration changes between resources. It is recommended to enable AWS Config be enabled in all regions.

The AWS configuration item history captured by AWS Config enables security analysis, resource change tracking, and compliance auditing.

## Remediation

To implement AWS Config configuration:

### Via AWS Management Console:

1. Select the region you want to focus on in the top right of the console.
2. Click `Services`.
3. Click `Config`.
4. Define which resources you want to record in the selected region.
5. Choose to include global resources (IAM resources).
6. Specify an S3 bucket in the same account or in another managed AWS account.
7. Create an SNS Topic from the same AWS account or another managed AWS account.

### Via AWS Command Line Interface:

1. Ensure there is an appropriate S3 bucket, SNS topic, and IAM role per the [AWS Config Service prerequisites](https://docs.aws.amazon.com/config/latest/developerguide/gs-cli-prereq.html).
2. Run this command to set up the configuration recorder

```bash
aws configservice subscribe --s3-bucket my-config-bucket --sns-topic arn:aws:sns:us-east-1:012345678912:my-config-notice --iam-role arn:aws:iam::012345678912:role/myConfigRole
 ```

3. Run this command to start the configuration recorder:

```bash
start-configuration-recorder --configuration-recorder-name <value>
```

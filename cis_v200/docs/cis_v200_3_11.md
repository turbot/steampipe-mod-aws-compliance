## Description

S3 object-level API operations such as GetObject, DeleteObject, and PutObject are called data events. By default, CloudTrail trails don't log data events and so it is recommended to enable Object-level logging for S3 buckets.

Enabling object-level logging will help you meet data compliance requirements within your organization, perform comprehensive security analysis, monitor specific patterns of user behavior in your AWS account or take immediate actions on any object-level API activity using Amazon CloudWatch Events.

## Remediation

### From Console:

1. Login to the AWS Management Console and navigate to S3 dashboard at https://console.aws.amazon.com/s3/.
2. In the left navigation panel, click `buckets` and then click on the S3 Bucket Name that you want to examine.
3. Click `Properties` tab to see in detail bucket configuration.
4. Click on the `Object-level` logging setting, enter the CloudTrail name for the recording activity. You can choose an existing Cloudtrail or create a new one by navigating to the Cloudtrail console link https://console.aws.amazon.com/cloudtrail/.
5. Once the Cloudtrail is selected, check the Read event checkbox, so that `object-level` logging for `Read` events is enabled.
6. Repeat steps 2 to 5 to enable `object-level` logging of read events for other S3 buckets.

### From Command Line:

1. To enable `object-level` data events logging for S3 buckets within your AWS account, run `put-event-selectors` command using the name of the trail that you want to reconfigure as identifier:

```bash
aws cloudtrail put-event-selectors --region <region-name> --trail-name <trail-name> --event-selectors '[{ "ReadWriteType": "ReadOnly", "IncludeManagementEvents":true, "DataResources": [{ "Type": "AWS::S3::Object", "Values": ["arn:aws:s3:::<s3-bucket-name>/"] }] }]'
```

2. The command output will be `object-level` event trail configuration.
3. If you want to enable it for all buckets at once then change Values parameter to `["arn:aws:s3"]` in command given above.
4. Repeat step 1 for each s3 bucket to update `object-level` logging of write events.
5. Change the AWS region by updating the `--region` command parameter and perform the process for other regions.

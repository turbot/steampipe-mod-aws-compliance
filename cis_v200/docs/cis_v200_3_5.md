## Description

AWS Config is a web service that performs configuration management of supported AWS resources within your account and delivers log files to you. The recorded information includes the configuration item (AWS resource), relationships between configuration items (AWS resources), any configuration changes between resources. It is recommended AWS Config be enabled in all regions.

The AWS configuration item history captured by AWS Config enables security analysis, resource change tracking, and compliance auditing.

## Remediation

To implement AWS Config configuration:

### From Console:

1. Select the region you want to focus on in the top right of the console.
2. Click Services.
3. Click Config.
4. If a Config recorder is enabled in this region, you should navigate to the Settings page from the navigation menu on the left hand side. If a Config recorder is not yet enabled in this region then you should select "Get Started".
5. Select "Record all resources supported in this region".
6. Choose to include global resources (IAM resources).
7. Specify an S3 bucket in the same account or in another managed AWS account.
8. Create an SNS Topic from the same AWS account or another managed AWS account.

### From Command Line:

1. Ensure there is an appropriate S3 bucket, SNS topic, and IAM role per the [AWS Config Service prerequisites](https://docs.aws.amazon.com/config/latest/developerguide/gs-cli-prereq.html).
2. Run this command to create a new configuration recorder:

```bash
aws configservice put-configuration-recorder --configuration-recorder name=default,roleARN=arn:aws:iam::012345678912:role/myConfigRole --recording- group allSupported=true,includeGlobalResourceTypes=true
```

3. Create a delivery channel configuration file locally which specifies the channel attributes, populated from the prerequisites set up previously:

```bash
{
    "name": "default",
    "s3BucketName": "my-config-bucket",
    "snsTopicARN": "arn:aws:sns:us-east-1:012345678912:my-config-notice",
    "configSnapshotDeliveryProperties":{
        "deliveryFrequency": "Twelve_Hours"
    }
}
```

4. Run this command to create a new delivery channel, referencing the json configuration file made in the previous step:

```bash
aws configservice put-delivery-channel --delivery-channel file://deliveryChannel.json
```

5. Start the configuration recorder by running the following command:

```bash
aws configservice start-configuration-recorder --configuration-recorder-name default
```
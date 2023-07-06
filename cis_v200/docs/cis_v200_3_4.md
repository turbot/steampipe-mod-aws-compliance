## Description

AWS CloudTrail is a web service that records AWS API calls made in a given AWS account. The recorded information includes the identity of the API caller, the time of the API call, the source IP address of the API caller, the request parameters, and the response elements returned by the AWS service. CloudTrail uses Amazon S3 for log file storage and delivery, so log files are stored durably. In addition to capturing CloudTrail logs within a specified S3 bucket for long term analysis, real time analysis can be performed by configuring CloudTrail to send logs to CloudWatch Logs. For a trail that is enabled in all regions in an account, CloudTrail sends log files from all those regions to a CloudWatch Logs log group. It is recommended that CloudTrail logs be sent to CloudWatch Logs.

**Note:** The intent of this recommendation is to ensure AWS account activity is being captured, monitored, and appropriately alarmed on. CloudWatch Logs is a native way to accomplish this using AWS services but does not preclude the use of an alternate solution.

Sending CloudTrail logs to CloudWatch Logs will facilitate real-time and historic activity logging based on user, API, resource, and IP address, and provides opportunity to establish alarms and notifications for anomalous or sensitivity account activity.

## Remediation

To ensure that CloudTrail trails are integrated with CloudWatch Logs, perform the following to establish the prescribed state:

### From Console:

1. Log into the CloudTrail console at https://console.aws.amazon.com/cloudtrail/
2. Select the `Trail` the needs to be updated.
3. Scroll down to `CloudWatch Logs`.
4. Click `Edit`.
5. Under `CloudWatch Logs` click the box `Enabled`.
6. Under `Log Group` pick new or select an existing log group.
7. Edit the `Log group name` to match the CloudTrail or pick the existing CloudWatch Group.
8. Under `IAM Role` pick new or select an existing.
9. Edit the `Role name` to match the CloudTrail or pick the existing IAM Role.
10. Click `Save changes`.

### From Command Line:

```bash
aws cloudtrail update-trail --name <trail_name> --cloudwatch-logs-log-grouparn <cloudtrail_log_group_arn> --cloudwatch-logs-role-arn <cloudtrail_cloudwatchLogs_role_arn>
```

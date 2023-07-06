## Description

CloudTrail log file validation creates a digitally signed digest file containing a hash of each log that CloudTrail writes to S3. These digest files can be used to determine whether a log file was changed, deleted, or unchanged after CloudTrail delivered the log. It is recommended that file validation be enabled on all CloudTrails.

Enabling log file validation will provide additional integrity checking of CloudTrail logs.

## Remediation

Perform the following to enable log file validation on a given trail:

### From Console:

1. Sign in to the AWS Management Console and open the IAM console at https://console.aws.amazon.com/cloudtrail.
2. Click on `Trails` on the left navigation pane.
3. Click on target trail.
4. With in the `General details` section click `edit`.
5. Under the `Advanced settings` section.
6. Check the enable box under `Log file validation`.
7. Click `Save changes`.

### From Command Line:

```bash
aws cloudtrail update-trail --name <trail_name> --enable-log-file-validation
```

Note that periodic validation of logs using these digests can be performed by running the following command:

```bash
aws cloudtrail validate-logs --trail-arn <trail_arn> --start-time <start_time> --end-time <end_time>
```

### Default Value:

Not Enabled.
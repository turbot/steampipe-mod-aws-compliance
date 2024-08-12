## Description

Ensure the Instance Metadata Service Version 2 (IMDSv2) method is enabled on all running instances.

The IMDSv2 method uses session-based controls to help protect access and control of Amazon Elastic Compute Cloud (Amazon EC2) instance metadata. With IMDSv2, controls can be implemented to restrict changes to instance metadata.

## Remediation

### From the Console:

1. At this time the instance metadata setting for existing instances can only be changed using AWS CLI.

### From the CLI:

1. Run the modify-instance-metadata-options command using the list of Instances collect in the audit

```bash
aws ec2 modify-instance-metadata-options --instance-id i-1234567abcdefghi0 --
http-tokens required --http-endpoint enabled
```

2. The output should show the information for the instance and the metadata changes:

``` bash
{
InstanceId": "i-1234567abcdefghi0",
"InstanceMetadataOptions": {
"State": "pending",
"HttpTokens": "required",
"HttpPutResponseHopLimit": 1,
"HttpEndpoint": "enabled"
}
}
```

3. Repeat for the other instances and regions collected during the audit.
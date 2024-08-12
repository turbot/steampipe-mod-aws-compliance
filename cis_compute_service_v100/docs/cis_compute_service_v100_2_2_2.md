## Description

To protect your data disable the public mode of EBS snapshots.

This protects your data so that it is not accessible to all AWS accounts preventing accidental access and leaks.

## Remediation

Perform the following to set a snapshot to private:

### From Console:

1. Login to the EC2 console at https://console.aws.amazon.com/ec2/.
2. In the left pane click `Snapshots`.
3. Select the `snapshot` then click 'Actions, Modify Permissions`.
4. Click the radio button for `Private`.
5. Click `Save`.
6. Repeat for any additional Snapshots, Regions and AWS accounts.

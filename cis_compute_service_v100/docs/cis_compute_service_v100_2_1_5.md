## Description

EC2 allows you to make an AMI public, sharing it with all AWS accounts.

Publicly sharing an AMI with all AWS accounts could expose organizational data and configuration information.

## Remediation

Perform the steps below to set an AMIs to Private.

### From Console:

1. Login to the EC2 console at https://console.aws.amazon.com/ec2/.
2. In the left pane, under `Images`, click `AMIs`.
3. Confirm the `Owned by me `is set.
4. Select the AMI from the list.
5. Click on the `Permissions` Tab.
6. Click on `Edit`.
7. Click on the radio button `Private`.

Add AWS Account Number if you have a need to share with other Internal AWS accounts that your Organization owns.

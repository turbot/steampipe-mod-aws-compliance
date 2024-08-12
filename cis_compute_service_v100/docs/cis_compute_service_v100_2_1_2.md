## Description

Amazon Machine Images should utilize EBS Encrypted snapshots.

AMIs backed by EBS snapshots should use EBS encryption. Snapshot volumes can be encrypted and attached to an AMI.

## Remediation

Perform the following to encrypt AMI EBS Snapshots:

### From Console:

1. Login to the EC2 console at https://console.aws.amazon.com/ec2/.
2. In the left pane click on `AMIs`.
3. Select the AMI that does not comply to the encryption policy.
4. Click on `Actions`.
5. Click on `Copy AMI`.

```bash
Destination region - `Select the region the AMI is in`.
Name - `Enter the new Name`
Description - `Enter the new description`
Encryption - `Select` Encrypt target EBS snapshots
```

6. Click on Copy AMI.

```bash
Once the AMI has finished copying.
```

7. Select the AMI that does not have encrypted EBS snapshots.
8. Click on `Actions`.
9. Click on `Deregister`
## Description

The naming convention for AMI (Amazon Machine Images) should be documented and followed for any AMI's created.

The majority of AWS resources can be named and tagged. Most organizations have already created standardize naming conventions, and have existing rules in effect. They simply need to extend that for all AWS cloud resources to include Amazon Machine Images (AMI)

## Remediation

If the AMI Name for an AMI doesn't follow Organization policy Perform the following to copy and rename the AMI:

### From Console:

1. Login to the EC2 console at https://console.aws.amazon.com/ec2/.
2. In the left pane click `Images`, click `AMIs`.
3. Select the AMI that does not comply to the naming policy.
4. Click on `Actions`.
5. Click on `Copy AMI`.

```bash
Destination region - Select the region the AMI is in.
Name - `Enter the new Name`
Description - `Enter the new description`
Encryption - `Select` if it matches your image policy
```

6. Click on Copy AMI.

```bash
Once the AMI has finished copying.
```
7. Select the AMI that does not comply to the naming policy.
8. Click on `Actions`.
9. Click on `Deregister`
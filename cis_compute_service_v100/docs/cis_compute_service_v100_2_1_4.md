## Description

Ensure that your AMIs are not older than 90 days.

Using up-to-date AMIs will provide many benefits from OS updates and security patches helping to ensure reliability, security and compliance.

## Remediation

Perform these steps if the Creation date is older than 90 days.

### From Console:

1. Login to the EC2 console at https://console.aws.amazon.com/ec2/.
2. In the left pane, under `Images`, click `AMIs`.
3. Select the `AMI` to be updated.
4. Click on `Launch`.
5. Go through the EC2 Instance creation process.
6. Apply all system, security and application updates that are applicable to the EC2 instance.
7. Once completed click on `Instance state`, `Stop instance`.
8. Click on `Actions, Image and templates, Create image`.
9. Once the image process has complete return to the AMI list but clicking on `Images, AMIs`.
10. Select the AMI that is older than 90 days.
11. Click on `Actions, Deregister`.

Repeat these steps for any other AMIs older than 90 days.

## Description

When an EC2 instance is launched a specified custom security group should be assigned to the instance.

When an EC2 Instance is launched the default security group is automatically assigned. In error a lot of instances are launched in this way, and if the default security group is configured to allow unrestricted access, it will increase the attack footprint allowing the opportunity for malicious activity.

## Remediation

### From Console:

1. Login to EC2 using https://console.aws.amazon.com/ec2/.
2. On the left Click `Network & Security`, click `Security Groups`.
3. Select `Security Groups`.
4. Click on the `default Security Group` you want to review.
5. Click `Actions, View details`.
6. Select the `Inbound rules` tab.
7. Click on `Edit inbound rules`.
8. Click on `Delete` for all the rules listed.
9. Once there are no rules listed click on 'Save rules`
10. Repeat steps no. 3 – 8 for any other default security groups listed.
## Description

Identify any running AWS EC2 instances older than 180 days.

An EC2 instance is not supposed to run indefinitely and having instance older than 180 days can increase the risk of problems and issues.

## Remediation

### From Console:

1. Login to EC2 using https://console.aws.amazon.com/ec2/.
2. On the left Click `INSTANCES`, click `Instances`.
3. Select the `EC2 instance` identified above in the audit. The Instance State must be 'running'.
4. Click `Actions`, click `Instance State`, click Stop.
5. Wait for the Instance State to read 'stopped'.
6. Click 'Actions' click 'Instance State', click 'Start'
7. Select the Description tab.
8. Check the Launch time.

Confirm that the instance active age is now set to today's date and time.
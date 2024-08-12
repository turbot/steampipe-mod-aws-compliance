## Description

User Data can be specified when launching an ec2 instance. Examples include specifying parameters for configuring the instance or including a simple script.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services` and click `EC2` under Compute.
3. Click on `Instances`.
4. If the instance is currently running, stop the instance first.

**Note**: ensure there is no negative impact from stopping the instance prior to stopping the instance.

5. For each instance, click `Actions -> Instance Settings -> Edit` user data
6. For each instance, edit the user data to ensure there are no secrets or sensitive data stored. A Secret Management solution such as AWS Secrets Manager can be used here as a more secure mechanism of storing necessary sensitive data.
7. Repeat this remediation for all the other AWS regions.

**Note**: If the ec2 instances are created via automation or infrastructure-as-code, edit the user data in those pipelines and code.
## Description

When enabling the Metadata Service on AWS EC2 instances, users have the option of using either Instance Metadata Service Version 1 (IMDSv1; a request/response method) or Instance Metadata Service Version 2 (IMDSv2; a session-oriented method).

Allowing Version 1 of the service may open EC2 instances to Server-Side Request Forgery (SSRF) attacks, so Amazon recommends utilizing Version 2 for better instance security.

## Remediation

### From Console:

1. Log in to AWS Management Console and open the Amazon EC2 console using https://console.aws.amazon.com/ec2/.
2. Under the Instances menu, select Instances.
3. For each Instance, select the instance, then choose Actions > Modify instance metadata options.
4. If the Instance metadata service is enabled, set IMDSv2 to Required.

### From Command Line:

```bash
aws ec2 modify-instance-metadata-options --instance-id <instance_id> --http- tokens required
```
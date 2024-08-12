## Description

Ensure that detailed monitoring is enabled for your Amazon EC2 instances.

Monitoring is an important part of maintaining the reliability, availability, and performance of your Amazon EC2 instances.

## Remediation

### From Console:

1. Login to EC2 using https://console.aws.amazon.com/ec2/.
2. On the left Click `INSTANCES`, click `Instances`.
3. Select the `EC2 instance `you want to review.
4. Select the `Monitoring` tab.
5. Click on 'Enable Detailed Monitoring`.
6. Click on `Yes, Enable`.
7. Repeat steps no. 3 – 6 for any other instances that require detailed monitoring to be enabled.

### From the CLI:

1. Run the monitor-instances command using the list of instances collected in the audit.

```bash
aws ec2 monitor-instances --instance-ids <i-instancename>
```

2. The output will show 'state: pending'.
3. Wait a few minutes and run the same command again for that instance and it will show enabled.
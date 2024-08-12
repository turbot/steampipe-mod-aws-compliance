## Description

Identify and delete any unused Amazon AWS Elastic Network Interfaces in order to adhere to best practices and to avoid reaching the service limit. An AWS Elastic Network Interface (ENI) is pronounced unused when is not attached anymore to an EC2 instance.

## Remediation

### From the Console:

1. Login to EC2 using https://console.aws.amazon.com/ec2/.
2. On the left Click `NETWORK & SECURITY`, click `Network Interfaces`.
3. Select the ENI that you want to remove.
4. Click 'Actions', then 'delete'
5. Click `Delete`.
6. Repeat steps 3 - 5 any other ENIs listed in the audit within the current region.

**Note** Repeat the audit process for all other regions used.

### From the CLI:

1. Run the delete-network-interface command with the ENI names collected above in the audit.

```bash
aws ec2 delete-network-interface --region us-east-1 --network-interface-id eni-1234abcd
```

2. This will remove the ENI that is not being used.
3. Repeat steps 1 - 2 for any ENIs within the current region.

**Note** Repeat the audit process for all other regions used.
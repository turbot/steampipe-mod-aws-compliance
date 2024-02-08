## Description

VPC Flow Logs is a feature that enables you to capture information about the IP traffic going to and from network interfaces in your VPC. After you've created a flow log, you can view and retrieve its data in Amazon CloudWatch Logs. It is recommended that VPC Flow Logs be enabled for packet "Rejects" for VPCs.

VPC Flow Logs provide visibility into network traffic that traverses the VPC and can be used to detect anomalous traffic or insight during security workflows.

## Remediation

Perform the following to determine if VPC Flow logs is enabled:

### From Console:

1. Sign in to the management console.
2. Select `Services` then `VPC`.
3. In the left navigation pane, select `Your VPCs`.
4. Select a VPC.
5. In the right pane, select the `Flow Logs` tab.
6. If no Flow Log exists, click `Create Flow Log`.
7. For Filter, select `Reject`.
8. Enter in a `Role` and `Destination Log Group`.
9. Click `Create Log Flow`.
10. Click on `CloudWatch Logs Group`.

**Note**: Setting the filter to "Reject" will dramatically reduce the logging data accumulation for this recommendation and provide sufficient information for the purposes of breach detection, research and remediation. However, during periods of least privilege security group engineering, setting this the filter to "All" can be very helpful in discovering existing traffic flows required for proper operation of an already running environment.

### From Command Line:

1. Create a policy document and name it as `role_policy_document.json` and paste the following content:

```bash
{
  "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "test",
        "Effect": "Allow",
        "Principal":{
            "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
}
```

2. Create another policy document and name it as `iam_policy.json` and paste the following content:

```bash
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action":[
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:PutLogEvents",
          "logs:GetLogEvents",
          "logs:FilterLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
```

3. Run the below command to create an IAM role:

```bash
aws iam create-role --role-name <aws_support_iam_role> --assume-role-policy- document file://<file-path>role_policy_document.json
```

4. Run the below command to create an IAM policy:

```bash
aws iam create-policy --policy-name <ami-policy-name> --policy-document file://<file-path>iam-policy.json
```

5. Run `attach-group-policy` command using the IAM policy ARN returned at the previous step to attach the policy to the IAM role (if the command succeeds, no output is returned):

```bash
aws iam attach-group-policy --policy-arn arn:aws:iam::<aws-account- id>:policy/<iam-policy-name> --group-name <group-name>
```

6. Run describe-vpcs to get the VpcId available in the selected region:

```bash
aws ec2 describe-vpcs --region <region-name>
```

7. The command output should return the VPC Id available in the selected region.
8. Run `create-flow-logs` to create a flow log for the vpc:

```bash
aws ec2 create-flow-logs --resource-type VPC --resource-ids <vpc-id> -- traffic-type REJECT --log-group-name <log-group-name> --deliver-logs-permission-arn <iam-role-arn>
```

9. Repeat step 8 for other vpcs available in the selected region.
10. Change the region by updating --region and repeat remediation procedure for other vpcs.

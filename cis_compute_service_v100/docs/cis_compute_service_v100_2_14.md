## Description

Tags can help with managing, identifying, organizing, searching for, and filtering resources. Additionally, tags can help with security and compliance. Tags can be propagated from an Auto Scaling group to the EC2 instances that it launches.

## Remediation

### AWS Console

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services` and click `EC2` under `Compute`.
3. Select Auto Scaling Groups.
4. Click `Edit` for each Auto Scaling Group.
5. Check the `Tag new instances` Box for the Auto Scaling Group.
6. Click `Update`.
7. Repeat Steps 1-6 for each AWS Region used.

### AWS CLI

1. Run `aws autoscaling create-or-update-tags` for tags that are not set to `PropogateAtLaunch` for each Auto Scaling Group that does not have this property set to true.

```bash
aws autoscaling create-or-update-tags \
--tags ResourceId=example-autoscaling-group,ResourceType=auto-scaling-
group,Key=TagKey,Value=TagValue,PropagateAtLaunch=true
```

2. Repeat Step 1 for each AWS Region used.
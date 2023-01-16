## Description

Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established changes made to Identity and Access Management (IAM) policies.

Monitoring changes to IAM policies will help ensure authentication and authorization controls remain intact.

## Remediation

Perform the following to setup the metric filter, alarm, SNS topic, and subscription:

1. Create a metric filter based on filter pattern provided which checks for IAM policy changes and the <cloudtrail_log_group_name> taken from audit step 1.

```bash
aws logs put-metric-filter --log-group-name `<cloudtrail_log_group_name>` -- filter-name `<iam_changes_metric>` --metric-transformations metricName= `<iam_changes_metric>` ,metricNamespace='CISBenchmark',metricValue=1 -- filter-pattern '{($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||($.eventNa me=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolic y)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=Del etePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersi on)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.event Name=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGr oupPolicy)||($.eventName=DetachGroupPolicy)}'
```

**Note**: You can choose your own metricName and metricNamespace strings. Using the same metricNamespace for all Foundations Benchmark metrics will group them together.


2. Create an SNS topic that the alarm will notify

```bash
aws sns create-topic --name <sns_topic_name>
```

**Note**: You can execute this command once and then re-use the same topic for all monitoring alarms.

3. Create an SNS subscription to the topic created in step 2

```bash
aws sns subscribe --topic-arn <sns_topic_arn> --protocol <protocol_for_sns> - -notification-endpoint <sns_subscription_endpoints>
```

**Note**: You can execute this command once and then re-use the SNS subscription for all monitoring alarms.

4. Create an alarm that is associated with the CloudWatch Logs Metric Filter created in step 1 and an SNS topic created in step 2

```bash
aws cloudwatch put-metric-alarm --alarm-name `<iam_changes_alarm>` -- metric-name `<iam_changes_metric>` --statistic Sum --period 300 --threshold
1 --comparison-operator GreaterThanOrEqualToThreshold --evaluation-periods 1 --namespace 'CISBenchmark' --alarm-actions <sns_topic_arn>
```

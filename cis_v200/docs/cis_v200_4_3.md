## Description

Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs, or an external Security information and event management (SIEM) environment, and establishing corresponding metric filters and alarms.

It is recommended that a metric filter and alarm be established for 'root' login attempts to detect the unauthorized use, or attempts to use the root account.

Monitoring for 'root' account logins will provide visibility into the use of a fully privileged account and an opportunity to reduce the use of it.

Cloud Watch is an AWS native service that allows you to observe and monitor resources and applications. CloudTrail Logs can also be sent to an external Security information and event management (SIEM) environment for monitoring and alerting.

## Remediation

If you are using CloudTrails and CloudWatch, perform the following to setup the metric filter, alarm, SNS topic, and subscription:

1. Create a metric filter based on filter pattern provided which checks for 'Root' account usage and the `<cloudtrail_log_group_name>` taken from audit step 1.

```bash
aws logs put-metric-filter --log-group-name `<cloudtrail_log_group_name>` -- filter-name `<root_usage_metric>` --metric-transformations metricName= `<root_usage_metric>` ,metricNamespace='CISBenchmark',metricValue=1 --filter- pattern '{ $.userIdentity.type = "Root" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != "AwsServiceEvent" }'
```

**Note**: You can choose your own metricName and metricNamespace strings. Using the same metricNamespace for all Foundations Benchmark metrics will group them together.

2. Create an SNS topic that the alarm will notify

```bash
aws sns create-topic --name <sns_topic_name>
```

**Note**: you can execute this command once and then re-use the same topic for all monitoring alarms.

3. Create an SNS subscription to the topic created in step 2

```bash
aws sns subscribe --topic-arn <sns_topic_arn> --protocol <protocol_for_sns> --notification-endpoint <sns_subscription_endpoints>
```

**Note**: you can execute this command once and then re-use the SNS subscription for all monitoring alarms.

4. Create an alarm that is associated with the CloudWatch Logs Metric Filter created in step 1 and an SNS topic created in step 2

```bash
aws cloudwatch put-metric-alarm --alarm-name `<root_usage_alarm>` --metric- name `<root_usage_metric>` --statistic Sum --period 300 --threshold 1 -- comparison-operator GreaterThanOrEqualToThreshold --evaluation-periods 1 -- namespace 'CISBenchmark' --alarm-actions <sns_topic_arn>
```
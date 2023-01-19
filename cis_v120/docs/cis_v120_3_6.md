## Description

Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for failed console authentication attempts.

Monitoring failed console logins may decrease lead time to detect an attempt to brute force a credential, which may provide an indicator, such as source IP, that can be used in other event correlation.

## Remediation

Perform the following to setup the metric filter, alarm, SNS topic, and subscription:

1. Create a metric filter based on filter pattern provided which checks for AWS management Console Login Failures and the <cloudtrail_log_group_name> taken from audit step 1.

```bash
aws logs put-metric-filter --log-group-name <cloudtrail_log_group_name> -- filter-name `<console_signin_failure_metric>` --metric-transformations metricName= `<console_signin_failure_metric>`,metricNamespace='CISBenchmark',metricValue=1 --filter-pattern '{ ($.eventName = ConsoleLogin) && ($.errorMessage = "Failed authentication") }'
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
aws cloudwatch put-metric-alarm --alarm-name
`<console_signin_failure_alarm>` --metric-name `<console_signin_failure_metric>` --statistic Sum --period 300 --threshold 1 --comparison-operator GreaterThanOrEqualToThreshold --evaluation-periods 1 -- namespace 'CISBenchmark' --alarm-actions <sns_topic_arn>
```

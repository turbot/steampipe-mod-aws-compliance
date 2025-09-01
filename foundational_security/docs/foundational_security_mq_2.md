## Description

This control checks whether an Amazon MQ ActiveMQ broker streams audit logs to Amazon CloudWatch Logs. The control fails if the broker doesn't stream audit logs to CloudWatch Logs.

By publishing ActiveMQ broker logs to CloudWatch Logs, you can create CloudWatch alarms and metrics that increase the visibility of security-related information.

## Remediation

To stream ActiveMQ broker logs to CloudWatch Logs, see [Configuring Amazon MQ for ActiveMQ logs](https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/configure-logging-monitoring-activemq.html) in the Amazon MQ Developer Guide.
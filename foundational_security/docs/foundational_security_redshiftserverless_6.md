## Description

This control checks whether an Amazon Redshift Serverless namespace is configured to export connection and user logs to Amazon CloudWatch Logs. The control fails if the Redshift Serverless namespace isn't configured to export the logs to CloudWatch Logs.

If you configure Amazon Redshift Serverless to export connection log (connectionlog) and user log (userlog) data to a log group in Amazon CloudWatch Logs, you can collect and store your log records in durable storage, which can support security, access, and availability reviews and audits. With CloudWatch Logs, you can also perform real-time analysis of log data and use CloudWatch to create alarms and review metrics.

## Remediation

To export log data for an Amazon Redshift Serverless namespace to Amazon CloudWatch Logs, the respective logs must be selected for export in the audit logging configuration settings for the namespace. For information about updating these settings, see [Editing security and encryption](https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-console-configuration-edit-network-settings.html) in the Amazon Redshift Management Guide.
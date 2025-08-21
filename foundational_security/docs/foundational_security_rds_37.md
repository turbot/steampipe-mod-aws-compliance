## Description

This control checks whether an Amazon Aurora PostgreSQL DB cluster is configured to publish logs to Amazon CloudWatch Logs. The control fails if the Aurora PostgreSQL DB cluster isn't configured to publish PostgreSQL logs to CloudWatch Logs.

Database logging provides detailed records of requests made to an RDS cluster. Aurora PostgreSQL generates event logs that contain useful information for administrators. Publishing these logs to CloudWatch Logs centralizes log management and helps you perform real-time analysis of the log data. CloudWatch Logs retains logs in highly durable storage. You can also create alarms and view metrics in CloudWatch.

## Remediation

To publish Aurora PostgreSQL DB cluster logs to CloudWatch Logs, see [Publishing Aurora PostgreSQL logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.CloudWatch.html) in the Amazon RDS User Guide.
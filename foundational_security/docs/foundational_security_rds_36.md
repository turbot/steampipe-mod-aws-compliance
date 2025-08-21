## Description

This control checks whether an Amazon RDS for PostgreSQL DB instance is configured to publish logs to Amazon CloudWatch Logs. The control fails if the PostgreSQL DB instance isn't configured to publish the log types mentioned in the logTypes parameter to CloudWatch Logs.

Database logging provides detailed records of requests made to an RDS instance. PostgreSQL generates event logs that contain useful information for administrators. Publishing these logs to CloudWatch Logs centralizes log management and helps you perform real-time analysis of the log data. CloudWatch Logs retains logs in highly durable storage. You can also create alarms and view metrics in CloudWatch.

## Remediation

To publish PostgreSQL DB instance logs to CloudWatch Logs, see [Publishing PostgreSQL logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.Concepts.PostgreSQL.html#USER_LogAccess.Concepts.PostgreSQL.PublishtoCloudWatchLogs) in the Amazon RDS User Guide.

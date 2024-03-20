## Description

This control checks whether logging is enabled with the minimum severity level of LOGGER_SEVERITY_DEFAULT for DMS replication tasks TARGET_APPLY and TARGET_LOAD. The control fails if logging isn't enabled for these tasks or if the minimum severity level is less than LOGGER_SEVERITY_DEFAULT.

DMS uses Amazon CloudWatch to log information during the migration process. Using logging task settings, you can specify which component activities are logged and how much information is logged. You should specify logging for the following tasks:

- TARGET_APPLY – Data and data definition language (DDL) statements are applied to the target database.

- TARGET_LOAD – Data is loaded into the target database.

Logging plays a critical role in DMS replication tasks by enabling monitoring, troubleshooting, auditing, performance analysis, error detection, and recovery, as well as historical analysis and reporting. It helps ensure the successful replication of data between databases while maintaining data integrity and compliance with regulatory requirements. Logging levels other than DEFAULT are rarely needed for these components during troubleshooting. We recommend keeping the logging level as DEFAULT for these components unless specifically requested to change it by AWS Support. A minimal logging level of DEFAULT ensures that informational messages, warnings, and error messages are written to the logs. This control checks if the logging level is at least one of the following for the preceding replication tasks: LOGGER_SEVERITY_DEFAULT, LOGGER_SEVERITY_DEBUG, or LOGGER_SEVERITY_DETAILED_DEBUG

## Remediation

To enable logging for target database DMS replication tasks, see [Viewing and managing AWS DMS task logs](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Monitoring.html#CHAP_Monitoring.ManagingLogs) in the AWS Database Migration Service User Guide.
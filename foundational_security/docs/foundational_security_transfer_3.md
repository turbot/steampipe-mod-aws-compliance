## Description

This control checks whether Amazon CloudWatch logging is enabled for an AWS Transfer Family connector. The control fails if CloudWatch logging isn't enabled for the connector.

Amazon CloudWatch is a monitoring and observability service that provides visibility into your AWS resources, including AWS Transfer Family resources. For Transfer Family, CloudWatch provides consolidated auditing and logging for workflow progress and results. This includes several metrics that Transfer Family defines for workflows. You can configure Transfer Family to automatically log connector events in CloudWatch. To do this, you specify a logging role for the connector. For the logging role, you create an IAM role and a resource-based IAM policy that defines the permissions for the role.

## Remediation

For information about enabling CloudWatch logging for a Transfer Family connector, see [Amazon CloudWatch logging for AWS Transfer Family servers](https://docs.aws.amazon.com/transfer/latest/userguide/structured-logging.html) in the AWS Transfer Family User Guide.
## Description

This control checks whether logging is enabled for an Amazon MSK connector. The control fails if logging is disabled for the MSK connector.

Amazon MSK connectors integrate external systems and Amazon services with Apache Kafka by continuously copying streaming data from a data source into an Apache Kafka cluster, or continuously copying data from a cluster into a data sink. MSK Connect can write log events that can help debug a connector. When you create a connector, you can specify zero or more of the following log destinations: Amazon CloudWatch Logs, Amazon S3, and Amazon Data Firehose.

## Remediation

To enable logging for an existing Amazon MSK connector, you have to re-create the connector with the appropriate logging configuration. For information about configuration options, see [Logging for MSK Connect](https://docs.aws.amazon.com/msk/latest/developerguide/msk-connect-logging.html) in the Amazon Managed Streaming for Apache Kafka Developer Guide.
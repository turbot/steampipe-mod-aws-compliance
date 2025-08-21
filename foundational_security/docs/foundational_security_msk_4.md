## Description

This control checks whether public access is disabled for an Amazon MSK cluster. The control fails if public access is enabled for the MSK cluster.

By default, clients can access an Amazon MSK cluster only if they're in the same VPC as the cluster. All communication between Kafka clients and an MSK cluster are private by default and streaming data doesn't traverse the internet. However, if an MSK cluster is configured to allow public access, anyone on the internet can establish a connection to Apache Kafka brokers that are running within the cluster. This can lead to issues such as unauthorized access, data breaches, or exploitation of vulnerabilities. If you restrict access to a cluster by requiring authentication and authorization measures, you can help protect sensitive information and maintain the integrity of your resources.

## Remediation

For information about managing public access to an Amazon MSK cluster, see [Turn on public access to an MSK Provisioned cluster](https://docs.aws.amazon.com/msk/latest/developerguide/public-access.html) in the Amazon Managed Streaming for Apache Kafka Developer Guide.
## Description

This control checks whether unauthenticated access is enabled for an Amazon MSK cluster. The control fails if unauthenticated access is enabled for the MSK cluster.

Amazon MSK supports client authentication and authorization mechanisms to control access to a cluster. These mechanisms verify the identity of clients connecting to the cluster and determine which actions clients can perform. An MSK cluster can be configured to allow unauthenticated access, which allows any client with network connectivity to publish and subscribe to Kafka topics without providing credentials. Running an MSK cluster without requiring authentication violates the principle of least privilege and can expose the cluster to unauthorized access. It can allow any client to access, modify, or delete data in Kafka topics, potentially resulting in data breaches, unauthorized data modifications, or service disruptions. We recommend enabling authentication mechanisms such as IAM authentication, SASL/SCRAM, or mutual TLS to ensure proper access control and maintain security compliance.

## Remediation

For information about changing the authentication settings for an Amazon MSK cluster, see the following sections of the Amazon Managed Streaming for Apache Kafka Developer Guide: [Update security settings of an Amazon MSK cluster](https://docs.aws.amazon.com/msk/latest/developerguide/msk-update-security.html) and [Authentication and authorization for Apache Kafka APIs.](https://docs.aws.amazon.com/msk/latest/developerguide/kafka_apis_iam.html)
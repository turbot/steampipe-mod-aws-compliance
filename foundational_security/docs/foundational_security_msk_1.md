## Description

This controls checks if an Amazon MSK cluster is encrypted in transit with HTTPS (TLS) among the broker nodes of the cluster. The control fails if plain text communication is enabled for a cluster broker node connection.

HTTPS offers an extra layer of security as it uses TLS to move data and can be used to help prevent potential attackers from using person-in-the-middle or similar attacks to eavesdrop on or manipulate network traffic. By default, Amazon MSK encrypts data in transit with TLS. However, you can override this default at the time that you create the cluster. We recommend using encrypted connections over HTTPS (TLS) for-broker node connections.

## Remediation

To update encryption settings for MSK clusters, see [Updating security settings of a cluster](https://docs.aws.amazon.com/msk/latest/developerguide/msk-update-security.html) in the Amazon Managed Streaming for Apache Kafka Developer Guide.
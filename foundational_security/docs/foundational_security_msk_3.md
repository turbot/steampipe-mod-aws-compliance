## Description

This control checks whether an Amazon MSK Connect connector is encrypted in transit. This control fails if the connector isn't encrypted in transit.

Data in transit refers to data that moves from one location to another, such as between nodes in your cluster or between your cluster and your application. Data may move across the internet or within a private network. Encrypting data in transit reduces the risk that an unauthorized user can eavesdrop on network traffic.

## Remediation

You can enable encryption in transit when you create an MSK Connect connector. You can't change encryption settings after creating a connector. For more information, see [Create a connector](https://docs.aws.amazon.com/msk/latest/developerguide/mkc-create-connector-intro.html) in the Amazon Managed Streaming for Apache Kafka Developer Guide.
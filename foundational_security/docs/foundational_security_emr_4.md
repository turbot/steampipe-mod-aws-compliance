## Description

This control checks whether an Amazon EMR security configuration has encryption in transit enabled. The control fails if the security configuration doesn't enable encryption in transit.

Data in transit refers to data that moves from one location to another, such as between nodes in your cluster or between your cluster and your application. Data may move across the internet or within a private network. Encrypting data in transit reduces the risk that an unauthorized user can eavesdrop on network traffic.

## Remediation

To enable encryption in transit in an Amazon EMR security configuration, see [Configure data encryption](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-create-security-configuration.html#emr-security-configuration-encryption.html) in the Amazon EMR Management Guide.
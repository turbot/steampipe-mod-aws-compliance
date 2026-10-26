## Description

This control checks whether an OpenSearch domain endpoint is configured to use the latest TLS security policy. The control fails if the OpenSearch domain endpoint isn't configured to use the latest supported policy or if HTTPS isn't enabled. The latest policy is `Policy-Min-TLS-1-2-PFS-2023-10`, which can be changed with the `opensearch_domain_latest_tls_security_policies` variable.

HTTPS (TLS) can be used to help prevent potential attackers from using person-in-the-middle or similar attacks to eavesdrop on or manipulate network traffic. Only encrypted connections over HTTPS (TLS) should be allowed. Encrypting data in transit can affect performance. You should test your application with this feature to understand the performance profile and the impact of TLS. TLS 1.2 provides several security enhancements over previous versions of TLS.

## Remediation

To enable TLS encryption, use the [UpdateDomainConfig](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/configuration-api.html#configuration-api-actions-updatedomainconfig) API operation to configure the [DomainEndpointOptions](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/configuration-api.html#configuration-api-datatypes-domainendpointoptions) in order to set the `TLSSecurityPolicy`. For more information, see [Node-to-node encryption](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ntn.html) in the Amazon OpenSearch Service Developer Guide.
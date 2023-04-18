## Description

This control checks whether OpenSearch domains have node-to-node encryption enabled. This control fails if node-to-node encryption is disabled on the domain.

HTTPS (TLS) can be used to help prevent potential attackers from eavesdropping on or manipulating network traffic using person-in-the-middle or similar attacks. Only encrypted connections over HTTPS (TLS) should be allowed. Enabling node-to-node encryption for OpenSearch domains ensures that intra-cluster communications are encrypted in transit.

There can be a performance penalty associated with this configuration. You should be aware of and test the performance trade-off before enabling this option.

## Remediation

Node-to-node encryption can only be enabled on a new domain. To remediate this finding, create a new domain with `Node-to-node encryption` enabled and migrate your data to the new domain. Follow the instructions to [create a new domain](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/createupdatedomains.html#es-createdomains) in the Amazon OpenSearch Service Developer Guide and ensure that you select the `Node-to-node encryption` option when creating the new domain. Then follow [Using a snapshot to migrate data](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/version-migration.html#snapshot-based-migration) to migrate your data to the new domain.
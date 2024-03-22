## Description

This control checks whether an Amazon OpenSearch Service domain has the latest software update installed. The control fails if a software update is available but not installed for the domain

OpenSearch Service software updates provide the latest platform fixes, updates, and features available for the environment. Keeping up-to-date with patch installation helps maintain domain security and availability. If no action is taken on required updates, the service software is updated automatically (typically after 2 weeks). We recommend scheduling updates during a time of low traffic to the domain to minimize service disruption.

## Remediation

To install software updates for an OpenSearch domain, see [Starting an update](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/service-software.html#service-software-requesting) in the Amazon OpenSearch Service Developer Guide.
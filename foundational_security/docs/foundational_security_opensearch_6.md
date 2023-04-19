## Description

This control checks whether OpenSearch domains are configured with at least three data nodes and `zoneAwarenessEnabled` is `true`. This control fails for an OpenSearch domain if `instanceCount` is less than 3 or `zoneAwarenessEnabled` is `false`.

An OpenSearch domain requires at least three data nodes for high availability and fault-tolerance. Deploying an OpenSearch domain with at least three data nodes ensures cluster operations if a node fails.

## Remediation

**To modify the number of data nodes in an OpenSearch domain**

1. Sign in to the AWS console and open the [Amazon OpenSearch Service](https://console.aws.amazon.com/es/).
2. Under `My domains`, choose the name of the domain to edit, and choose `Edit`.
3. Under `Data nodes` set `Number of nodes` to a number greater than 3. If you are deploying to three Availability Zone, set the number to a multiple of three to ensure equal distribution across Availability Zones.
4. Choose `Submit`.
## Description

This control checks whether an Amazon DocumentDB cluster has deletion protection enabled. The control fails if the cluster doesn't have deletion protection enabled.

Enabling cluster deletion protection offers an additional layer of protection against accidental database deletion or deletion by an unauthorized user. An Amazon DocumentDB cluster can't be deleted while deletion protection is enabled. You must first disable deletion protection before a delete request can succeed. Deletion protection is enabled by default when you create a cluster in the Amazon DocumentDB console.

## Remediation

To enable deletion protection for an existing Amazon DocumentDB cluster, see [Modifying an Amazon DocumentDB cluster](https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-modify.html) in the Amazon DocumentDB Developer Guide. In the Modify Cluster section, choose Enable for Deletion protection.
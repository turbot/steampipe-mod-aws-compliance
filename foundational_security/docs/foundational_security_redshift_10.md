## Description

This control checks if Amazon Redshift clusters are encrypted at rest. The control fails if a Redshift cluster isn't encrypted at rest or if the encryption key is different from the provided key in the rule parameter.

In Amazon Redshift, you can turn on database encryption for your clusters to help protect data at rest. When you turn on encryption for a cluster, the data blocks and system metadata are encrypted for the cluster and its snapshots. Encryption of data at rest is a recommended best practice because it adds a layer of access management to your data. Encrypting Redshift clusters at rest reduces the risk that an unauthorized user can access the data stored on disk.

## Remediation

To modify a Redshift cluster to use KMS encryption, see [Changing cluster encryption](https://docs.aws.amazon.com/redshift/latest/mgmt/changing-cluster-encryption.html) in the Amazon Redshift Management Guide.
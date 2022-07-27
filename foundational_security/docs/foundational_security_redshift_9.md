## Description

This control checks whether an Amazon Redshift cluster has changed the database name from its default value. The control will fail if the database name for a Redshift cluster is set to dev.

When creating a Redshift cluster, you should change the default database name to a unique value. Default names are public knowledge and should be changed upon configuration. As an example, a well-known name could lead to inadvertent access if it was used in IAM policy conditions.

## Remediation

You cannot change the database name for your Amazon Redshift cluster after it is created. To create a new cluster, follow the instructions [here](https://docs.aws.amazon.com/redshift/latest/gsg/getting-started.html).
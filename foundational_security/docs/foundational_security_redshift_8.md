## Description

This control checks whether a Amazon Redshift cluster has changed the admin username from its default value. This control will fail if the admin username for a Redshift cluster is set to awsuser.

When creating a Redshift cluster, you should change the default admin username to a unique value. Default usernames are public knowledge and should be changed upon configuration. Changing the default usernames reduces the risk of unintended access.

## Remediation

You cannot change the admin username for your Amazon Redshift cluster after it is created. To create a new cluster, follow the instructions [here](https://docs.aws.amazon.com/redshift/latest/gsg/getting-started.html).
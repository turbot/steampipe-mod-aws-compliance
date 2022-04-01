## Description

This control checks whether an Amazon RDS database cluster has changed the admin username from its default value. This rule will fail if the admin username is set to the default value.

When creating an Amazon RDS database, you should change the default admin username to a unique value. Default usernames are public knowledge and should be changed during RDS database creation. Changing the default usernames reduces the risk of unintended access.

## Remediation

For changing the admin username associated with the Amazon RDS database cluster, [create a new RDS database cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.CreateInstance.html) and change the default admin username while creating the database.
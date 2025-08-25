## Description

This control checks whether an Amazon Redshift Serverless namespace uses the default database name, dev. The control fails if the Redshift Serverless namespace uses the default database name, dev.

When creating an Amazon Redshift Serverless namespace, you should specify a unique, custom value for the database name and not use the default database name, which is dev. The default database name is public knowledge. By specifying a different database name, you can mitigate risks such as unauthorized users inadvertently gaining access to data in the namespace.

## Remediation

You can't change the database name for an Amazon Redshift Serverless namespace after you create the namespace. You can, however, specify a custom database name for a Redshift Serverless namespace when you create the namespace. For information about creating a namespace, see [Workgroups and namespaces](https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-workgroup-namespace.html) in the Amazon Redshift Management Guide.
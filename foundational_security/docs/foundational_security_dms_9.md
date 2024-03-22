## Description

This control checks whether an AWS DMS endpoint uses an SSL connection. The control fails if the endpoint doesn't use SSL.

SSL/TLS connections provide a layer of security by encrypting connections between DMS replication instances and your database. Using certificates provides an extra layer of security by validating that the connection is being made to the expected database. It does so by checking the server certificate that is automatically installed on all database instances that you provision. By enabling SSL connection on your DMS endpoints, you protect the confidentiality of the data during the migration.

## Remediation

To add an SSL connection to a new or existing DMS endpoint, see [Using SSL with AWS Database Migration Service](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Security.SSL.html#CHAP_Security.SSL.Procedure) in the AWS Database Migration Service User Guide.
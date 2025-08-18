## Description

This control checks whether connections to an Amazon RDS for MariaDB DB instance are encrypted in transit. The control fails if the DB parameter group associated with the DB instance is not in sync, or the `require_secure_transport` parameter of the parameter group is not set to `ON`.

**Note:** This control doesn't evaluate Amazon RDS DB instances that use MariaDB versions earlier than version 10.5. The `require_secure_transport` parameter is supported only for MariaDB versions 10.5 and later.

Data in transit refers to data that moves from one location to another, such as between nodes in a DB cluster or between a DB cluster and a client application. Data can move across the internet or within a private network. Encrypting data in transit reduces the risk of unauthorized users eavesdropping on network traffic.

## Remediation

For information about enabling SSL/TLS for connections to an Amazon RDS for MariaDB DB instance, see [Requiring SSL/TLS for all connections to a MariaDB DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/mariadb-ssl-connections.require-ssl.html) in the Amazon Relational Database Service User Guide.
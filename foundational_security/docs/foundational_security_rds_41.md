## Description

This control checks whether a connection to an Amazon RDS for Microsoft SQL Server DB instance is encrypted in transit. The control fails if the rds.force_ssl parameter of the parameter group associated with the DB instance is set to 0 (off).

Data in transit refers to data that moves from one location to another, such as between nodes in a DB cluster or between a DB cluster and a client application. Data can move across the internet or within a private network. Encrypting data in transit reduces the risk of unauthorized users eavesdropping on network traffic.

## Remediation

For information about enabling SSL/TLS for connections to Amazon RDS DB instances running Microsoft SQL Server, see [Using SSL with a Microsoft SQL Server DB Instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/SQLServer.Concepts.General.SSL.Using.html) in the Amazon Relational Database Service User Guide.
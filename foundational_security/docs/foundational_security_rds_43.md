## Description

This control checks whether an Amazon RDS DB proxy requires TLS for all connections between the proxy and the underlying RDS DB instance. The control fails if the proxy doesn't require TLS for all connections between the proxy and the RDS DB instance.

Amazon RDS Proxy can act as an additional layer of security between client applications and underlying RDS DB instances. For example, you can connect to an RDS proxy using TLS 1.3, even if the underlying DB instance supports an older version of TLS. By using RDS Proxy, you can enforce strong authentication requirements for database applications.

## Remediation

For information about changing the settings for an Amazon RDS proxy to require TLS, see [Modifying an RDS proxy](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-proxy-modifying-proxy.html) in the Amazon Relational Database Service User Guide.
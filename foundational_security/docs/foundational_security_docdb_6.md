## Description

This controls checks whether an Amazon DocumentDB cluster requires TLS for connections to the cluster. The control fails if the cluster parameter group associated with the cluster is not in sync, or the TLS cluster parameter is set to disabled or enabled.

You can use TLS to encrypt the connection between an application and an Amazon DocumentDB cluster. Use of TLS can help protect data from being intercepted while the data is in transit between an application and an Amazon DocumentDB cluster. Encryption in transit for an Amazon DocumentDB cluster is managed using the TLS parameter in the cluster parameter group that's associated with the cluster. When encryption in transit is enabled, secure connections using TLS are required to connect to the cluster. We recommend using the following TLS parameters: tls1.2+, tls1.3+, and fips-140-3

## Remediation

For information about changing the TLS settings for an Amazon DocumentDB cluster, see [Encrypting data in transit](https://docs.aws.amazon.com/documentdb/latest/developerguide/security.encryption.ssl.html) in the Amazon DocumentDB Developer Guide.
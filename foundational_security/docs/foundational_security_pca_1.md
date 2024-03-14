## Description

This control checks if AWS Private CA has a root certificate authority (CA) that is disabled. The control fails if the root CA is enabled.

With AWS Private CA, you can create a CA hierarchy that includes a root CA and subordinate CAs. You should minimize the use of the root CA for daily tasks, especially in production environments. The root CA should only be used to issue certificates for intermediate CAs. This allows the root CA to be stored out of harm's way while the intermediate CAs perform the daily task of issuing end-entity certificates.

## Remediation

To disable the root CA, see [Update CA status](https://docs.aws.amazon.com/privateca/latest/userguide/console-update.html#console-update-status-steps) in the AWS Private Certificate Authority User Guide.
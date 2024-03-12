## Description

This control checks whether RSA certificates managed by AWS Certificate Manager use a key length of at least 2,048 bits. The control fails if the key length is smaller than 2,048 bits.

The strength of encryption directly correlates with key size. We recommend key lengths of at least 2,048 bits to protect your AWS resources as computing power becomes less expensive and servers become more advanced.

## Remediation

The minimum key length for RSA certificates issued by ACM is already 2,048 bits. For instructions on issuing new RSA certificates with ACM, see [Issuing and managing certificates](https://docs.aws.amazon.com/acm/latest/userguide/gs.html) in the AWS Certificate Manager User Guide.

While ACM allows you to import certificates with shorter key lengths, you must use keys of at least 2,048 bits to pass this control. You can't change the key length after importing a certificate. Instead, you must delete certificates with a key length smaller than 2,048 bits. For more information about importing certificates into ACM, see [Prerequisites for importing certificates](https://docs.aws.amazon.com/acm/latest/userguide/import-certificate-prerequisites.html) in the AWS Certificate Manager User Guide.

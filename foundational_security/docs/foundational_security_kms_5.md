## Description

This control checks whether an AWS KMS key is publicly accessible. The control fails if the KMS key is publicly accessible.

Implementing least privilege access is fundamental to reducing security risk and the impact of errors or malicious intent. If the key policy for an AWS KMS key allows access from external accounts, third parties might be able to encrypt and decrypt data by using the key. This could result in an internal or external threat exfiltrating data from AWS services that use the key.

## Remediation

For information about updating the key policy for an AWS KMS key, see [Key policies in AWS KMS](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-overview) in the AWS Key Management Service Developer Guide.
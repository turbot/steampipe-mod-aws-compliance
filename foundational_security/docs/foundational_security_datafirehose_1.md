## Description

This control checks whether an Amazon Data Firehose delivery stream is encrypted at rest with server-side encryption. This control fails if a Firehose delivery stream isn't encrypted at rest with server-side encryption.

Server-side encryption is a feature in Amazon Data Firehose delivery streams that automatically encrypts data before it's at rest by using a key created in AWS Key Management Service (AWS KMS). Data is encrypted before it's written to the Data Firehose stream storage layer, and decrypted after it’s retrieved from storage. This allows you to comply with regulatory requirements and enhance the security of your data.

## Remediation

To enable server-side encryption on Firehose delivery streams, see [Data Protection in Amazon Data Firehose](https://docs.aws.amazon.com/firehose/latest/dev/encryption.html) in the Amazon Data Firehose Developer Guide.
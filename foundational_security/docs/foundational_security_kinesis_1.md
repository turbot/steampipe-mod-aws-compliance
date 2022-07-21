## Description

This control checks if Kinesis Data Streams are encrypted at rest with server-side encryption. This control fails if a Kinesis stream is not encrypted at rest with server-side encryption.

Server-side encryption is a feature in Amazon Kinesis Data Streams that automatically encrypts data before it's at rest by using an AWS KMS key. Data is encrypted before it's written to the Kinesis stream storage layer, and decrypted after it’s retrieved from storage. As a result, your data is encrypted at rest within the Amazon Kinesis Data Streams service.

## Remediation

For information about enabling server-side encryption for Kinesis streams, see [How Do I Get Started with Server-Side Encryption?](https://docs.aws.amazon.com/streams/latest/dev/getting-started-with-sse.html) in the Amazon Kinesis Developer Guide.
## Description

AWS Key Management Service (KMS) allows customers to rotate the backing key which is key material stored within the KMS which is tied to the key ID of the Customer Created customer master key (CMK). It is the backing key that is used to perform cryptographic operations such as encryption and decryption. Automated key rotation currently retains all prior backing keys so that decryption of encrypted data can take place transparently. It is recommended that CMK key rotation be enabled.

Rotating encryption keys helps reduce the potential impact of a compromised key as data encrypted with a new key cannot be accessed with a previous key that may have been exposed.

## Remediation

### Via the Management Console:

1. Sign in to the AWS Management Console and open the [IAM console](https://console.aws.amazon.com/iam).
2. In the left navigation pane, choose `Encryption Keys`.
3. Select a customer created master key (CMK).
4. Under the `Key Policy` section, move down to `Key Rotation`.
5. Check the `Rotate this key every year` checkbox.

### Via CLI

1. Run the following command to enable key rotation:

```bash
aws kms enable-key-rotation --key-id <kms_key_id>
```

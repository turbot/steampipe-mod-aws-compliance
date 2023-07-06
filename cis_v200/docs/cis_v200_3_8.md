## Description

AWS Key Management Service (KMS) allows customers to rotate the backing key which is key material stored within the KMS which is tied to the key ID of the Customer Created customer master key (CMK). It is the backing key that is used to perform cryptographic operations such as encryption and decryption. Automated key rotation currently retains all prior backing keys so that decryption of encrypted data can take place transparently. It is recommended that CMK key rotation be enabled for symmetric keys. Key rotation can not be enabled for any asymmetric CMK.

Rotating encryption keys helps reduce the potential impact of a compromised key as data encrypted with a new key cannot be accessed with a previous key that may have been exposed. Keys should be rotated every year, or upon event that would result in the compromise of that key.

## Remediation

### From Console:

1. Sign in to the AWS Management Console and open the IAM console at https://console.aws.amazon.com/iam.
2. In the left navigation pane, choose `Customer managed keys`.
3. Select a customer managed CMK where `Key spec = SYMMETRIC_DEFAULT`.
4. Underneath the "General configuration" panel open the tab "Key rotation".
5. Check the "Automatically rotate this KMS key every year." checkbox.

### From Command Line:

1. Run the following command to enable key rotation:

```bash
aws kms enable-key-rotation --key-id <kms_key_id>
```
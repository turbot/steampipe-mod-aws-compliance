## Description

Password policies are, in part, used to enforce password complexity requirements. IAM password policies can be used to ensure password are at least a given length. It is recommended that the password policy require a minimum password length 14.

Setting a password complexity policy increases account resiliency against brute force login attempts.

## Remediation

Perform the following to set the password policy as prescribed:

### Via AWS Console

1. Login to AWS Console (with appropriate permissions to View Identity Access Management Account Settings).
2. Go to IAM Service on the AWS Console.
3. Click on Account Settings on the Left Pane.
4. Set "Minimum password length" to `14` or greater.
5. Click "Apply password policy".

### Via CLI

```bash
aws iam update-account-password-policy --minimum-password-length 14
```

**Note**: All commands starting with "aws iam update-account-password-policy" can be combined into a single command.

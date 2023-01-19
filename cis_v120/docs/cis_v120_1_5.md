## Description

Password policies are, in part, used to enforce password complexity requirements. IAM password policies can be used to ensure password are comprised of different character sets. It is recommended that the password policy require at least one uppercase letter.

Setting a password complexity policy increases account resiliency against brute force login attempts.

## Remediation

Perform the following to set the password policy as prescribed:

### Via AWS Console

1. Login to AWS Console (with appropriate permissions to View Identity Access Management Account Settings).
2. Go to IAM Service on the AWS Console.
3. Click on Account Settings on the Left Pane.
4. Check "Requires at least one uppercase letter".
5. Click "Apply password policy".

### Via CLI

```bash
aws iam update-account-password-policy --require-uppercase-characters
```

**Note**: All commands starting with "aws iam update-account-password-policy" can be combined into a single command.

## Description

IAM password policies can prevent the reuse of a given password by the same user. It is recommended that the password policy prevent the reuse of passwords.

Preventing password reuse increases account resiliency against brute force login attempts.

## Remediation

Perform the following to set the password policy as prescribed:

### From Console:

1. Login to AWS Console (with appropriate permissions to View Identity Access Management Account Settings).
2. Go to IAM Service on the AWS Console.
3. Click on Account Settings on the Left Pane.
4. Check "Prevent password reuse".
5. Set "Number of passwords to remember" is set to `24`.

### From Command Line:

```bash
aws iam update-account-password-policy --password-reuse-prevention 24
```

**Note**: All commands starting with "aws iam update-account-password-policy" can be combined into a single command.

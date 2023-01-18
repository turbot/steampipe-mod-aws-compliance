## Description

IAM password policies can require passwords to be rotated or expired after a given number of days. It is recommended that the password policy expire passwords after 90 days or less.

Reducing the password lifetime increases account resiliency against brute force login attempts. Additionally, requiring regular password changes help in the following scenarios:

- Passwords can be stolen or compromised sometimes without your knowledge. This can happen via a system compromise, software vulnerability, or internal threat.
- Certain corporate and government web filters or proxy servers have the ability to intercept and record traffic even if it's encrypted.
- Many people use the same password for many systems such as work, email, and personal.
- Compromised end user workstations might have a keystroke logger.

## Remediation

Perform the following to set the password policy as prescribed:

### Via AWS Console:

1. Login to AWS Console (with appropriate permissions to View Identity Access Management Account Settings).
2. Go to IAM Service on the AWS Console.
3. Click on Account Settings on the Left Pane.
4. Check "Enable password expiration".
5. Set "Password expiration period (in days):" to 90 or less.

### Via CLI

```bash
aws iam update-account-password-policy --max-password-age 90
```

**Note**: All commands starting with "aws iam update-account-password-policy" can be combined into a single command.

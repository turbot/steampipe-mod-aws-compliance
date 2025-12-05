## Description

This control checks whether the password policy for an Amazon Cognito user pool requires the use of strong passwords, based on recommended settings for password policies. The control fails if the password policy for the user pool doesn't require strong passwords. You can optionally specify custom values for the policy settings that the control checks.

Strong passwords are a security best practice for Amazon Cognito user pools. Weak passwords can expose users' credentials to systems that guess passwords and try to access data. This is especially the case for applications that are open to the internet. Password policies are a central element of the security of user directories. By using a password policy, you can configure a user pool to require password complexity and other settings that comply with your security standards and requirements.

## Remediation

For information about creating or updating the password policy for an Amazon Cognito user pool, see [Adding user pool password requirements](https://docs.aws.amazon.com/cognito/latest/developerguide/managing-users-passwords.html#user-pool-settings-policies) in the Amazon Cognito Developer Guide.
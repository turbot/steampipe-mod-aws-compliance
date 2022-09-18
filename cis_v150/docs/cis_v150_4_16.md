## Description

Security Hub collects security data from across AWS accounts, services, and supported third-party partner products and helps you analyze your security trends and identify the highest priority security issues. When you enable Security Hub, it begins to consume, aggregate, organize, and prioritize findings from AWS services that you have enabled, such as Amazon GuardDuty, Amazon Inspector, and Amazon Macie. You can also enable integrations with AWS partner security products.

AWS Security Hub provides you with a comprehensive view of your security state in AWS and helps you check your environment against security industry standards and best practices - enabling you to quickly assess the security posture across your AWS accounts.

## Remediation

To grant the permissions required to enable Security Hub, attach the Security Hub managed policy AWSSecurityHubFullAccess to an IAM user, group, or role. Enabling Security Hub

### From Console

1. Use the credentials of the IAM identity to sign in to the Security Hub console.
2. When you open the Security Hub console for the first time, choose Enable AWS Security Hub.
3. On the welcome page, Security standards list the security standards that Security Hub supports.
4. Choose Enable Security Hub.

### From Command Line

1. Run the enable-security-hub command. To enable the default standards, include **--enable-default-standards**.

```bash
aws securityhub enable-security-hub --enable-default-standards
```

2. To enable the security hub without the default standards, include **--no-enable-default-standards**.

```bash
aws securityhub enable-security-hub --no-enable-default-standards
```

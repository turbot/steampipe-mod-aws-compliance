## Description

With AWS Config, you can track configuration changes to the Lambda functions (including deleted functions), runtime environments, tags, handler name, code size, memory allocation, timeout settings, and concurrency settings, along with Lambda IAM execution role, subnet, and security group associations.

This gives you a holistic view of the Lambda function’s lifecycle and enables you to surface that data for potential audit and compliance requirements.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Config` under Management & Governance.
3. This will open up the Config dashboard.
4. Click `Conformance packs`.
5. Click on `Deploy conformance pack`.
6. Click on `Use sample template`.
7. Click the down arrow under Sample template.
8. Scroll down and click on Operational Best Practices for Serverless.
9. Click Next.
10. Give it a Conformance pack name `Serverless`.
11. Click Next.
12. Click `Deploy conformance pack`.
13. Click on `Deploy conformance pack`.
14. Click on `Use sample template`.
15. Click the down arrow under Sample template.
16. Scroll down and click on Security Best Practices for Lambda.
17. Click Next.
18. Give it a Conformance pack name `LambaSecurity`.
19. Click Next.
20. Click `Deploy conformance pack`.
21. Repeat steps 2-20 for all regions used.
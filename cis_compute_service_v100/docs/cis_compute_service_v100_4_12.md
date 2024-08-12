## Description

As you can set your own environmental variables for Lambda it is important to also encrypt them for in transit protection.

Lambda environment variables should be encrypted in transit for client-side protection as they can store sensitive information.

## Remediation

### From the Console:

1. Login to the AWS Console using https://console.aws.amazon.com/lambda/.
2. In the left column, under `AWS Lambda`, click `Functions`.
3. Under `Function name` click on the name of the function that you want to review.
4. Click the Configuration tab.
5. In the left column, click `Environment variables`.
6. In the `Environment variables` section, click `Edit`.
7. Click the check box for `Enable helpers for encryption in transit`.
8. Click the `Encrypt` option for all the variable that need to be encrypted.
9. Repeat steps 2 – 8 for each Lambda function identified in the Audit within the current AWS region.
10. Repeat this remediation for all the other AWS regions.
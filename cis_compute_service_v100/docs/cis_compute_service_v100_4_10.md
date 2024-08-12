## Description

Ensure that all your Amazon Lambda functions are configured to allow access only to trusted AWS accounts in order to protect against unauthorized cross-account access.

Allowing unknown (unauthorized) AWS accounts to invoke your Amazon Lambda functions can lead to data exposure and data loss. To prevent any unauthorized invocation requests for your Lambda functions, restrict access only to trusted AWS accounts.

## Remediation

### From the Console:

1. Login to the AWS Console using https://console.aws.amazon.com/lambda/.
2. In the left column, under `AWS Lambda`, click `Functions`.
3. Under `Function name` click on the name of the function that you want to review.
4. Click the Configuration tab.
5. In the left column, click `Permissions`.
6. In the `Resource-based policy statements` section, select the policy statement that allows the unknown AWS Account cross-account access.
7. Click Edit.
8. On the `Edit permissions` page, replace or remove the AWS Account(s) ARN of the unauthorized principal in the Principal box.
9. Click Save.
10. Repeat steps for each Lambda function that failed the Audit.
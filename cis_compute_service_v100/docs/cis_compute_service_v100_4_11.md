## Description

Always using a recent version of the execution environment configured for your Amazon Lambda functions adheres to best practices for the newest software features, the latest security patches and bug fixes, and performance and reliability.

When you execute your Lambda functions using recent versions of the implemented runtime environment, you should benefit from new features and enhancements, better security, along with performance and reliability.

## Remediation

### From the Console:

1. Login to the AWS Console using https://console.aws.amazon.com/lambda/.
2. In the left column, under `AWS Lambda`, click `Functions`.
3. Under `Function name` click on the name of the function that you want to review.
4. Click Code tab.
5. Go to the Runtime settings section.
6. Click Edit.
7. On the Edit runtime settings page, select the latest supported version of the runtime environment from the dropdown list .
**Note - make sure the correct architecture is also selected.**
8. Click `Save`.
9. Select the Code tab.
10. Click Test from the Code source section.
11. Once the testing is completed, the execution result of your Lambda function will be listed.
12. Repeat steps for each Lambda function that failed the Audit within the current region.

### From the Command Line:

1. Run `aws lambda update-function-configuration` using the name of the Function you need to remediate

```
aws lambda update-function-configuration --output table --query 'Functions[*].FunctionName'
```

This command will provide a table titled ListFunctions

2. Run `aws lambda get-function-configuration` using the Function names
returned in the table.

```
aws lambda get-function-configuration --function-name "name_of_fuunction" --function-name "name_of_function" --runtime "python3.9"
```

3. The command output should return the metadata available for the reconfigured function.
4. Repeat steps 1-2 to upgrade the runtime environment for each Amazon Lambda function found in the Audit.
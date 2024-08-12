## Description

Every Lambda function should have a one to one IAM execution role and the roles should not be shared between functions.

The Principle of Least Privilege means that any Lambda function should have the minimal amount of access required to perform its tasks. In order to accomplish this Lambda functions should not share IAM Execution roles.

## Remediation

### From the Console:

1. Login to the AWS console using https://console.aws.amazon.com/lambda/.
2. In the left column, under `AWS Lambda`, click `Functions`.
3. Under `Function name` click on the name of the function that you want to change/update.
4. Click the `Configuration` tab.
5. Under General configuration on the left column, click `Permissions`.
6. Under the `Execution role` section, click `Edit`.
7. Scroll down to `Execution role`.

To use an existing IAM role
```
- Click `Use an existing role`
- Select the role from the `Existing role` dropdown.
- The IAM role can't be associated with another Lambda function and must follow the Principle of Least Privilege.
```

To use a new IAM role
```
- Click `Create a new role from AWS policy templates`
- Provide a unique name based on company policy in the `Role name`
- Select the policy templates from the `Policy templates` dropdown.
```

8. Click Save.
9. Repeat steps 2 – 8 for all the Lambda functions listed within the AWS region that do not have a unique IAM Execution Role.
10. Repeat this remediation process for all the AWS Regions.
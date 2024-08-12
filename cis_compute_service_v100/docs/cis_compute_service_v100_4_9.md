## Description

Ensure that your Amazon Lambda functions don't have administrative permissions potentially giving the function access to all AWS cloud services and resources.

In order to promote the Principle of Least Privilege (POLP) and provide your functions the minimal amount of access required to perform their tasks the right IAM execution role associated with the function should be used. Instead of providing administrative permissions you should grant the role the necessary permissions that the function really needs.

## Remediation

### From the Console:

1. Login in to the AWS Console using https://console.aws.amazon.com/lambda/.
2. In the left column, under `AWS Lambda`, click `Functions`.
3. Under `Function name` click on the name of the function that you want to remediate.
4. Click the Configuration tab.
5. Click on `Permissions` in the left column.
6. In the Execution role section, click the `Edit`.
7. Edit basic settings configuration page:

```
- associate the function with an existing, compliant IAM role
- click Use an existing role from the Execution role
- select the required role from the Existing role dropdown
- click Save
```

OR

```
- apply a new execution role to your Lambda function
- click Create a new role from AWS policy templates
- Provide a name for the new role based on org policy
- select only the necessary permission set(s) from the Policy templates -
optional dropdown list.
- click Save
```

8. Repeat steps for each Lambda function within the current region that failed the Audit.
## Description

In order to have the necessary permissions to access the AWS cloud services and resources Amazon Lambda functions should be associated with active(available) execution roles.

A Lambda function's execution role is an Identity and Access Management (IAM) role that grants the function permission to process and access specific AWS services and resources. When Amazon Lambda functions are not referencing active execution roles, the functions are losing the ability to perform critical operations securely.

## Remediation

### From the Console:

1. Login to the AWS Console using https://console.aws.amazon.com/lambda/.
2. In the left column, under `AWS Lambda`, click `Functions`.
3. Under `Function name` click on the name of the function that you want to update.
4. Click the Configuration tab.
5. In the left column, click `Permissions`.
6. In the `Execution role` section, click `Edit`.
7. In the `Edit basic settings` page, perform one of the following actions:

```
- Click Use an existing role if you already a execution role for the selected Lambda function.
- Select the IAM role from the `Existing role` dropdown list.
- Click Save.
```

OR

```
- Click To create a custom role, go to the `IAM console`.
- Click AWS Service
- Click `Lambda`.
- Click `Next: Permissions
- Attach the permission policies needed
- Click Next: Tags
- Add tags (optional) based on your Organizational policy
- Click Next: Review
- Enter a Role name and a Role description so you can attach the policy to
the Lambda function
- Click `Create role`
- Refresh the Edit basic settings page
- Select the new IAM role you just created from the `Existing role` dropdown
list.
- Click Save.
```

8. Repeat steps 2 – 7 to update the execution role for each misconfigured Amazon Lambda function within the current AWS region.
9. Repeat this Audit for all the other AWS regions.

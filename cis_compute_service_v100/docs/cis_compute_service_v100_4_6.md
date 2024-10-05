## Description

A publicly accessible Amazon Lambda function is open to the public and can be reviewed by anyone. To protect against unauthorized users that are sending requests to invoke these functions they need to be changed so they are not exposed to the public.

Allowing anyone to invoke and run your Amazon Lambda functions can lead to data exposure, data loss, and unexpected charges on your AWS bill.

## Remediation

### From the Console:

1. Login to the AWS Console using https://console.aws.amazon.com/lambda/.
2. In the left column, under `AWS Lambda`, click `Functions`.
3. Under `Function name` click on the name of the function that you want to review.
4. Click the Configuration tab.
5. In the left column, click `Permissions`.
6. In the `Resource-based policy section`, perform the following actions:
- Under Policy statements
- Select the policy statement that allows anonymous access
- Click Delete to remove the non-compliant statement from the resource-based policy attached
- Within the Delete statement confirmation box, click Remove
- Click Add permissions to add a new policy statement that grants permissions to a trusted entity only.
- On the Add permissions page configure the new policy statement to grant access to another AWS account, IAM user, IAM role, or to another AWS service.
- Click Save.
7. Repeat steps no. 2 – 6 for each Lambda function that fails the Audit above, withinthe current region.
8. Repeat this Audit for all the other AWS regions.

### From the Command Line:

1. Run 'aws lambda remove-permission'

```
aws lambda remove-permission --function-name "name_of_function" --statement-id "SID_of_Statement"
```

This command will remove the access policy that is failing the audit for that function.

2. Run `aws lambda add-permission`

```
aws lambda add-permission --function-name "name_of_function" --statement-id "correctaccess" --principal "012345678910" --action lambda:InvokeFunction
```

This adds a new policy to the function.

***Note The --principal parameter can be the ID of the trusted AWS account, another AWS account, IAM user, IAM role, or another AWS service.***

3. The command output should display the new policy created.
4. Repeat steps 1-2 for each Lambda function from the audit for all regions.
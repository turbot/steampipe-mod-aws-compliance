## Description

Lambda is fully integrated with IAM, allowing you to control precisely what each Lambda function can do within the AWS Cloud. As you develop a Lambda function, you expand the scope of this policy to enable access to other resources. For example, for a function that processes objects put into an S3 bucket, it requires read access to objects stored in that bucket. Do not grant the function broader permissions to write or delete data, or operate in other buckets.

You can use AWS Identity and Access Management (IAM) to manage access to the Lambda API and resources like functions and layers. For users and applications in your account that use Lambda, you manage permissions in a permissions policy that you can apply to IAM users, groups, or roles. To grant permissions to other accounts or AWS services that use your Lambda resources, you use a policy that applies to the resource itself.

## Remediation

### From the Console:

As building out the IAM permissions for Lambda here are some things to consider.
- Set granular IAM permissions for Lambda functions.
- Limit user access via IAM permissions to only necessary resources and operations.
- Remove unused or outdated IAM Users, Roles and Permissions.
- Periodically review and adjust IAM permissions.
- Do not allow all-access permissions for Lambda functions as a short cut."
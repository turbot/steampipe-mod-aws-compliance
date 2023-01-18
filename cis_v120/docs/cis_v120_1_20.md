## Description

AWS provides a support center that can be used for incident notification and response, as well as technical support and customer services. Create an IAM Role to allow authorized users to manage incidents with AWS Support.

By implementing least privilege for access control, an IAM Role will require an appropriate IAM Policy to allow Support Center Access in order to manage Incidents with AWS Support.

## Remediation

### Using the Amazon unified command line interface:

- Create an IAM role for managing incidents with AWS:
  - Create a trust relationship policy document that allows <iam_user> to manage AWS incidents, and save it locally as /tmp/TrustPolicy.json:

  ```bash
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "AWS": "<span style="font-style: italic;"><iam_user></span>"
          },
          "Action": "sts:AssumeRole"
        }
      ]
    }
  ```

  - Create the IAM role using the above trust policy:

  ```bash
  aws iam create-role --role-name <aws_support_iam_role> --assume-role- policy-document file:///tmp/TrustPolicy.json
  ```

  - Attach 'AWSSupportAccess' managed policy to the created IAM role:

  ```bash
  aws iam attach-role-policy --policy-arn <iam_policy_arn> --role-name <aws_support_iam_role>
  ```

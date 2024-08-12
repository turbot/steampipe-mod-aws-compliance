## Description

A tag policy enables you to define tag compliance rules to help you maintain consistency in the tags attached to your organization's resources.

You can use an EC2 tag policy to enforce your tag strategy across all of your EC2 resources.

## Remediation

### From Console:

You must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization’s management account. To create a tag policy

1. Login to the AWS Organizations using https://console.aws.amazon.com/organizations/.
2. Left hand side Click on `Policies`.
3. Under `Support policy types` click on `Tag policies`.
4. Under `Available policies` click on `Create policy`.
5. Enter policy name.
6. Enter policy description (Indicate this is the EC2 tag policy).
7. For New tag key 1, specify the name of a tag key to add.
8. For `Tag key capitalization compliance` select the box for Use the capitalization to enable this option mandating a specific capitalization for the tag key using this policy.
9. For `Resource types to enforce` check the box for `Prevent non-compliant operations for this tag`.
10. Click on `Specify resource types`.
11. Expand EC2.
12. Select ec2:image, ec2:instance, ec2:reserved-instances
13. Click `Save changes`.
14. Click `Create policy.`
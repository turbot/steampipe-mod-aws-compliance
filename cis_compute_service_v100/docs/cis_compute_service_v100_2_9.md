## Description

An inventory and management of Amazon Elastic Compute Cloud (Amazon EC2) instances is made possible with AWS Systems Manager.

Use AWS Systems Manager to provide detailed system configurations, operating system patch levels, services name and type, software installations, application name, publisher and version, and other details about your environment.

## Remediation

### From the Console:

These directions already assume your AWS account is setup. They will walk you through how to create non-Admin IAM users and groups for System Manager.
**Note** - There is additional guidance provided by AWS on the process.

1. Create a user group
  a. Login to IAM using https://console.aws.amazon.com/iam/.
  b. On the left Click `Access management`, click User groups, and then click `Create Group`.
  c. On the `Create user group page`, enter a name for the group.
  d. Select and add the users required to the Group.
  e. Attach permissions policies by selecting `ResourceGroupsandTagEditorFullAccess` policy.
  f. Then for Full access to Systems Manager console, click the `AmazonSSMFullAccess` policy.
  • OR
  g. For access to view Systems Manager data, and not create or update resources, click the `AmazonSSMReadOnlyAccess` policy.
  h. For access to the Built-In Insights and Dashboard by CloudWatch pages in the
  Systems Manager console, add these policies:
    • AWSHealthFullAccess
    • AWSConfigUserAccess
    • CloudWatchReadOnlyAccess
  i. Click `Create group`.

If you need additional users follow the next step. If not skip to Step 3.

2. Create users and assign permissions.
  a. Login to IAM using https://console.aws.amazon.com/iam/
  b. On the left Click `Access management`, click Users, and then click `Add users`.
  c. `User name`, enter the name that the user will use to sign in to AWS Systems Manager.
  d. To allow the user access to development tools, select the check box next to Access key - Programmatic access. This creates an access key for the new user. You can view or download the access keys when you get to the Final page.
  e. To allow user access to the AWS Management Console, select the check box next to AWS Management Console access. If you click Custom password, enter an initial password for the user. You can optionally select Require password reset to force the user to create a new password the next time the user signs in.
  f. Click `Next: Permissions`.
  g. To Set permissions, click `Add user to group`.
  h. In the `group list`, click the group you created in step 1
  i. Then click `Next: Tags`.
  j. (Optional) Add one or more tags
  k. Click `Next: Review` to see the list of group memberships that the new user is joining.
  l. Click `Create user`.

3. To add permissions for an existing user
  a. In the IAM console, click `Users`.
  b. click the name of the user to add to a group
  c. Then click `Add permission`.
  d. For Add user to group, select the box next to the group to add the user to
  e. Add any other available permission policies to assign to the user.
  f. Click `Next: Review` to see the list of group memberships that will be added to the new user.
  g. Click `Add permissions`.

4. Create an IAM instance profile for Systems Manager
  a. Login to the IAM console at https://console.aws.amazon.com/iam/
  b. In the left, click `Roles`, and then click `Create role`.
  c. Under S`elect type of trusted entity`, click `AWS service`.
  d. Click `EC2`, and then click `Next: Permissions`.
  e. On the `Attach permissions policies` page, do the following: Use the Search field to locate the `AmazonSSMManagedInstanceCore`. Select the box next to it. The console retains your selection even if you search for other policies.

**Note** - If you plan to join instances to an Active Directory managed by AWS Directory Service, search for AmazonSSMDirectoryServiceAccess and select the box next to its name.

**Note** - If you plan to use EventBridge or CloudWatch Logs to manage or monitor your instance, search for CloudWatchAgentServerPolicy and select the box next to its name.
  f. Click `Next: Tags`.
  g. Add one or more tag-key value pairs to organize, track, or control access for this role,
  h. Click `Next: Review`.
  i. For `Role name`, enter a name for your new instance profile
**Note** - Make a note of the role name. You will click this role when you create
  new instances that you want to manage by using Systems Manager.
  j. For `Role description`, enter a description for this instance profile.
  k. Click `Create role`.

The system returns you to the Roles page.

5. Attach the Systems Manager instance profile to an existing instance
  a. Login to the EC2 console at https://console.aws.amazon.com/ec2/.
  b. In he left pane, under `Instances`, click `Instances`.
  c. Select the instance from the list.
  d. In the `Actions menu`, click `Security, Modify IAM role`.
  e. Select the instance profile you created using the procedure in Step 4.
  f. Click `Save`.
6. Attach an IAM instance profile to an Amazon EC2 instance
  a. Login to the EC2 console at https://console.aws.amazon.com/ec2/.
  b. Select or confirm the `AWS Region` for the instance.
  c. Click `Launch Instance`.
  d. Locate the AMI for the instance type you want to create, and then click `Select`.
  e. Select the type of instance to launch, then click Next: `Configure Instance Details`.
  f. On the `Configure Instance Details` page, in the `IAM role` dropdown list, select the instance profile you created in Step 4.
  g. For other options on the page, make selections that meet your requirements for the instance.
  h. Complete the `wizard`.

If you create other instances that you want to configure using Systems Manager, specify the instance profile for each instance
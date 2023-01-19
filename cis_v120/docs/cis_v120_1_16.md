## Description

By default, IAM users, groups, and roles have no access to AWS resources. IAM policies are the means by which privileges are granted to users, groups, or roles. It is recommended that IAM policies be applied directly to groups and roles but not users.

Assigning privileges at the group or role level reduces the complexity of access management as the number of users grow. Reducing access management complexity may in-turn reduce opportunity for a principal to inadvertently receive or retain excessive privileges.

## Remediation

Perform the following to create an IAM group and assign a policy to it:

1. Sign in to the AWS Management Console and open the [IAM console](https://console.aws.amazon.com/iam/).
2. In the navigation pane, click Groups and then click `Create New Group`.
3. In the `Group Name` box, type the name of the group and then click `Next Step`.
4. In the list of policies, select the check box for each policy that you want to apply to all members of the group. Then click `Next Step`.
5. Click `Create Group`.

Perform the following to add a user to a given group:

1. Sign in to the AWS Management Console and open the [IAM console](https://console.aws.amazon.com/iam/).
2. In the navigation pane, click `Groups`.
3. Select the group to add a user to.
4. Click `Add Users To Group`.
5. Select the users to be added to the group.
6. Click `Add Users`.

Perform the following to remove a direct association between a user and policy:

1. Sign in to the AWS Management Console and open the [IAM console](https://console.aws.amazon.com/iam/).
2. In the left navigation pane, click on Users.
3. For each user:
  - Select the user.
  - Click on the `Permissions` tab.
  - Expand `Managed Policies`.
  - Click `Detach Policy` for each policy.
  - Expand `Inline Policies`.
  - Click `Remove Policy` for each policy.

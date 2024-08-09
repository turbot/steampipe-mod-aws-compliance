## Description

Tag policies help you standardize tags on all tagged resources across your organization.

You can use tag policies to define tag keys (including how they should be capitalized) and their allowed values.

## Remediation

### From Console:

You must sign in as an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization’s management account.

1. Login to AWS Organizations using https://console.aws.amazon.com/organizations/.
2. In the Left pane click on `Policies`.
3. Click on `Tag policies`.
4. Click on `Enable Tag Policies`.
5. The page is update with a list of the Available policies and the ability to create one.

### From Command Line:

You must use an IAM user, assume an IAM role, or sign in as the root user (not recommended) in the organization’s management account.

1. Run the enable-policy-type command

```bash
aws organizations enable-policy-type --root-id <RootID> --policy-type
TAG_POLICIES
```

The list of PolicyTypes in the output will now include the specified policy type with the Status of ENABLED.
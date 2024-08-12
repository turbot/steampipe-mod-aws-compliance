## Description

The Cross-service confused deputy problem is a security issue where an entity that doesn't have permission to perform an action can coerce a more-privileged entity to perform the action.

Cross-service impersonation can result in the confused deputy problem. Cross-service impersonation can occur when one service (the calling service) calls another serviceb(the called service). The calling service can be manipulated to use its permissions to act on another customer's resources in a way it should not otherwise have permission to access.

## Remediation

### From the Console:

1. Login to the AWS Console using https://console.aws.amazon.com/iam/.
2. On the left hand side under Access management, Click on `Roles`.
3. Search for any roles identified above in the audit.
4. Click on the role and update the Action AssumeRole, aws:SourceArn to contain the full ARN of the resource.

```
"aws:SourceArn": ["arn:aws:batch:us-east-1:123456789012:compute-environment/testCE",]
```

5. Repeat for any roles defined in the Audit.
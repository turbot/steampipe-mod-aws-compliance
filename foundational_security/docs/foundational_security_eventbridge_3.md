## Description

This control checks if an Amazon EventBridge custom event bus has a resource-based policy attached. This control fails if the custom event bus doesn't have a resource-based policy.

By default, an EventBridge custom event bus doesn't have a resource-based policy attached. This allows principals in the account to access the event bus. By attaching a resource-based policy to the event bus, you can limit access to the event bus to specified accounts, as well as intentionally grant access to entities in another account.

## Remediation

To attach a resource-based policy to an EventBridge custom event bus, see [Managing event bus permissions](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-bus-perms.html#eb-event-bus-permissions-manage) in the Amazon EventBridge User Guide.
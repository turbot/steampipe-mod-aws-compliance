## Description

This control checks whether AWS Systems Manager documents that are owned by the account are public. This control fails if SSM documents with the owner `Self` are public.

SSM documents that are public might allow unintended access to your documents. A public SSM document can expose valuable information about your account, resources, and internal processes.

Unless your use case requires public sharing to be enabled, Security Hub recommends that you turn on the block public sharing setting for your Systems Manager documents that are owned by `Self`.

## Remediation

For more information about disabling public access to SSM documents, see [Modify permissions for a shared SSM document](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-share-modify.html) and [Best practices for shared SSM documents](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-before-you-share.html) in the AWS Systems Manager User Guide.
## Description

This control checks whether an Amazon Cognito identity pool is configured to allow unauthenticated identities. The control fails if guest access is activated (the AllowUnauthenticatedIdentities parameter is set to true) for the identity pool.

If an Amazon Cognito identity pool allows unauthenticated identities, the identity pool provides temporary AWS credentials to users who haven't authenticated through an identity provider (guests). This creates security risks because it allows anonymous access to AWS resources. If you deactivate guest access, you can help ensure that only properly authenticated users can access your AWS resources, which reduces the risk of unauthorized access and potential security breaches. As a best practice, an identity pool should require authentication through supported identity providers. If unauthenticated access is necessary, it's important to carefully restrict permissions for unauthenticated identities, and regularly review and monitor their usage.

## Remediation

For information about deactivating guest access for an Amazon Cognito identity pool, see [Activate or deactivate guest access](https://docs.aws.amazon.com/cognito/latest/developerguide/identity-pools.html#enable-or-disable-unauthenticated-identities) in the Amazon Cognito Developer Guide.
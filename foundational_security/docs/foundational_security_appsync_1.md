## Description

This control checks whether an AWS AppSync API cache is encrypted at rest. The control fails if the API cache isn't encrypted at rest.

Data at rest refers to data that's stored in persistent, non-volatile storage for any duration. Encrypting data at rest helps you protect its confidentiality, which reduces the risk that an unauthorized user can access it.

## Remediation

You can't change the encryption settings after enabling caching for your AWS AppSync API. Instead, you must delete the cache and and recreate it with encryption enabled. For more information, see [Cache encryption](https://docs.aws.amazon.com/appsync/latest/devguide/enabling-caching.html#caching-encryption) in the AWS AppSync Developer Guide.

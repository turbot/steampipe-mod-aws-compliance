## Description

This control checks whether an AWS AppSync API cache is encrypted in transit. The control fails if the API cache isn't encrypted in transit.

Data in transit refers to data that moves from one location to another, such as between nodes in your cluster or between your cluster and your application. Data may move across the internet or within a private network. Encrypting data in transit reduces the risk that an unauthorized user can eavesdrop on network traffic.

## Remediation

You can't change the encryption settings after enabling caching for your AWS AppSync API. Instead, you must delete the cache and and recreate it with encryption enabled. For more information, see [Cache encryption](https://docs.aws.amazon.com/appsync/latest/devguide/enabling-caching.html#caching-encryption) in the AWS AppSync Developer Guide.

## Description

This control checks whether an Amazon DynamoDB Accelerator (DAX) cluster is encrypted in transit, with the endpoint encryption type set to TLS. The control fails if the DAX cluster isn't encrypted in transit.

HTTPS (TLS) can be used to help prevent potential attackers from using person-in-the-middle or similar attacks to eavesdrop on or manipulate network traffic. You should only allow encrypted connections over TLS to access DAX clusters. However, encrypting data in transit can affect performance. You should test your application with encryption turned on to understand the performance profile and the impact of TLS.

## Remediation

You can't change the TLS encryption setting after creating a DAX cluster. To encrypt an existing DAX cluster, create a new cluster with encryption in transit enabled, shift your application's traffic to it, and then delete the old cluster. For more information, see [Using deletion protection](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.Basics.html#WorkingWithTables.Basics.DeletionProtection) in the Amazon DynamoDB Developer Guide.
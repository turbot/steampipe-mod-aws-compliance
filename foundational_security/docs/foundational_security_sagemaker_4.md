## Description

This control checks whether production variants of an Amazon SageMaker AI endpoint have an initial instance count greater than 1. The control fails if the endpoint's production variants have only 1 initial instance.

Production variants running with an instance count greater than 1 permit multi-AZ instance redundancy managed by SageMaker AI. Deploying resources across multiple Availability Zones is an AWS best practice to provide high availability within your architecture. High availability helps you to recover from security incidents.

## Remediation

For more information about the parameters of endpoint configuration, see [Create an endpoint configuration](https://docs.aws.amazon.com/sagemaker/latest/dg/serverless-endpoints-create.html#serverless-endpoints-create-config) in the Amazon SageMaker AI Developer Guide.
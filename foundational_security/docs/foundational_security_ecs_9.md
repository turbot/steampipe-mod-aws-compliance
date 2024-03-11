## Description

This control checks if the latest active Amazon ECS task definition has a logging configuration specified. The control fails if the task definition doesn't have the logConfiguration property defined or if the value for logDriver is null in at least one container definition.

Logging helps you maintain the reliability, availability, and performance of Amazon ECS. Collecting data from task definitions provides visibility, which can help you debug processes and find the root cause of errors. If you are using a logging solution that does not have to be defined in the ECS task definition (such as a third party logging solution), you can disable this control after ensuring that your logs are properly captured and delivered.

## Remediation

To define a log configuration for your Amazon ECS task definitions, see [Specifying a log configuration in your task definition](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_awslogs.html#specify-log-config) in the Amazon Elastic Container Service Developer Guide.
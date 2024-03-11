## Description

This control checks whether an AWS AppSync API has field-level logging turned on. The control fails if the field resolver log level is set to None. Unless you provide custom parameter values to indicate that a specific log type should be enabled, Security Hub produces a passed finding if the field resolver log level is either ERROR or ALL.

You can use logging and metrics to identify, troubleshoot, and optimize your GraphQL queries. Turning on logging for AWS AppSync GraphQL helps you get detailed information about API requests and responses, identify and respond to issues, and comply with regulatory requirements.

## Remediation

To turn on logging for AWS AppSync, see [Setup and configuration](https://docs.aws.amazon.com/appsync/latest/devguide/monitoring.html#setup-and-configuration) in the AWS AppSync Developer Guide.

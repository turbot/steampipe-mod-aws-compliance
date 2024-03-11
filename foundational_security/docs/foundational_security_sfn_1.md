## Description

This controls checks whether an AWS Step Functions state machine has logging turned on. The control fails if a state machine doesn't have logging turned on. If you provide a custom value for the logLevel parameter, the control passes only if the state machine has the specified logging level turned on.

Monitoring helps you maintain the reliability, availability, and performance of Step Functions. You should collect as much monitoring data from the AWS services that you use so you can more easily debug multi-point failures. Having a logging configuration defined for your Step Functions state machines allows for you to track execution history and results in Amazon CloudWatch Logs. Optionally, you can track only errors or fatal events.

## Remediation

To turn on logging for a Step Functions state machine, see [Configure logging](https://docs.aws.amazon.com/step-functions/latest/dg/cw-logs.html#monitoring-logging-configure) in the AWS Step Functions Developer Guide.
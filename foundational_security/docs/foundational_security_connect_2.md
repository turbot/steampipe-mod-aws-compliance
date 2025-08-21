## Description

This control checks whether an Amazon Connect instance is configured to generate and store flow logs in an Amazon CloudWatch log group. The control fails if the Amazon Connect instance isn't configured to generate and store flow logs in a CloudWatch log group.

Amazon Connect flow logs provide real-time details about events in Amazon Connect flows. A flow defines the customer experience with an Amazon Connect contact center from start to finish. By default, when you create a new Amazon Connect instance, an Amazon CloudWatch log group is created automatically to store flow logs for the instance. Flow logs can help you analyze flows, find errors, and monitor operational metrics. You can also set up alerts for specific events that can occur in a flow.

## Remediation

For information about enabling flow logs for an Amazon Connect instance, see [Enable Amazon Connect flow logs in an Amazon CloudWatch log group](https://docs.aws.amazon.com/connect/latest/adminguide/contact-flow-logs.html) in the Amazon Connect Administrator Guide.
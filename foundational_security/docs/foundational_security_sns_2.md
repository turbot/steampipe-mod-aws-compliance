## Description

This control checks whether logging is enabled for the delivery status of notification messages sent to an Amazon SNS topic for the endpoints. This control fails if the delivery status notification for messages is not enabled.

Logging is an important part of maintaining the reliability, availability, and performance of services. Logging message delivery status helps provide operational insights, such as the following:
  - Knowing whether a message was delivered to the Amazon SNS endpoint.
  - Identifying the response sent from the Amazon SNS endpoint to Amazon SNS.
  - Determining the message dwell time (the time between the publish timestamp and the hand off to an Amazon SNS endpoint).

## Remediation

To remediate this issue, configuring your SNS topic delivery status logging.

**To encrypt an unencrypted SNS topic**

1. Open the [Amazon SNS console](https://console.aws.amazon.com/sns/v3/home).
2. In the navigation pane, choose `Topics`.
3. On the Topics page, choose a topic and then choose Edit.
4. On the Edit MyTopic page, expand the Delivery status logging section.
5. Choose the protocol for which you want to log delivery status; for example AWS Lambda.
6. Enter the Success sample rate (the percentage of successful messages for which you want to receive CloudWatch Logs.
7. In the IAM roles section, do one of the following:
  - To choose an existing service role from your account, choose Use existing service role and then specify IAM roles for successful and failed deliveries.
  - To create a new service role in your account, choose Create new service role, choose Create new roles to define the IAM roles for successful and failed deliveries in the IAM console.
  - To give Amazon SNS write access to use CloudWatch Logs on your behalf, choose Allow.
8. Choose Save changes.
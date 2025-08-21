## Description

This control checks if the Amazon SNS topic access policy allows public access. This control fails if the SNS topic access policy allows public access.

You use an Amazon SNS access policy with a particular topic to restrict who can work with that topic (for example, who can publish messages to it or who can subscribe to it). SNS policies can grant access to other AWS accounts, or to users within your own AWS account. Providing a wildcard (*) in the Principal field of the topic policy and a lack of conditions to limit the topic policy can result in data exfiltration, denial of service, or undesired injection of messages into your service by an attacker.

## Remediation

To update access policies for an SNS topic, see [Overview of managing access in Amazon SNS](https://docs.aws.amazon.com/sns/latest/dg/sns-when-to-use-access-control.html) in the Amazon Simple Notification Service Developer Guide.
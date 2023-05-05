## Description

This control checks whether logging is enabled for an AWS WAF global web ACL. This control fails if logging is not enabled for the web ACL.

Logging is an important part of maintaining the reliability, availability, and performance of AWS WAF globally. It is a business and compliance requirement in many organizations, and allows you to troubleshoot application behavior. It also provides detailed information about the traffic that is analyzed by the web ACL that is attached to AWS WAF.

## Remediation

You can enable logging for a web ACL from the Kinesis Data Firehose console.

**To enable logging for a web ACL**

1. Open the [Kinesis Data Firehose console](https://console.aws.amazon.com/firehose/).
2. Create a Kinesis Data Firehose delivery stream.The name must start with the prefix `aws-waf-logs-`. For example, `aws-waf-logs-us-east-2-analytics`. Create the Kinesis Data Firehose delivery stream with a `PUT` source and in the Region where you operate. If you capture logs for Amazon CloudFront, create the delivery stream in US East (N. Virginia). For more information, see [Creating an Amazon Kinesis Data Firehose delivery stream](https://docs.aws.amazon.com/firehose/latest/dev/basic-create.html) in the Amazon Kinesis Data Firehose Developer Guide.
3. From `Services`, choose `WAF & Shield`. Then choose `Switch to AWS WAF Classic`.
4. From `Filter`, choose `Global (CloudFront)`.
5. Choose the web ACL to enable logging for.
6. Under `Logging`, choose `Enable logging`.
7. Choose the Kinesis Data Firehose delivery stream that you created earlier. You must choose a delivery stream that has a name that begins with `aws-waf-logs-`.
8. Choose `Enable logging`.
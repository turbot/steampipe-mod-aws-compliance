## Description

This control checks whether an AWS WAF rule or rule group has Amazon CloudWatch metrics enabled. The control fails if the rule or rule group doesn't have CloudWatch metrics enabled.

Configuring CloudWatch metrics on AWS WAF rules and rule groups provides visibility into traffic flow. You can see which ACL rules are triggered and which requests are accepted and blocked. This visibility can help you identify malicious activity on your associated resources.

## Remediation

To enable CloudWatch metrics on an AWS WAF rule group, invoke the [UpdateRuleGroup](https://docs.aws.amazon.com/waf/latest/APIReference/API_UpdateRuleGroup.html) API. To enable CloudWatch metrics on an AWS WAF rule, invoke the [UpdateWebACL](https://docs.aws.amazon.com/waf/latest/APIReference/API_UpdateWebACL.html) API. Set the CloudWatchMetricsEnabled field to true. When you use the AWS WAF console to create rules or rule groups, CloudWatch metrics are automatically enabled.
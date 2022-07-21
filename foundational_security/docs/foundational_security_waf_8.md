## Description

This control checks whether an AWS WAF global web ACL contains at least one WAF rule or WAF rule group. The control fails if a web ACL does not contain any WAF rules or rule groups.

A WAF global web ACL can contain a collection of rules and rule groups that inspect and control web requests. If a web ACL is empty, the web traffic can pass without being detected or acted upon by WAF depending on the default action.

## Remediation

To remediate this issue, update your WAF web ACL to add atleast one rule or rule group.

**To add rules or rule groups to an empty web ACL**

1. Open the [AWS WAF console](https://console.aws.amazon.com/wafv2/).
2. In the navigation pane, choose **Switch to AWS WAF Classic**, and then choose `Web ACLs`.
3. For Filter, choose Global (CloudFront).
4. Choose the name of the empty web ACL.
5. Choose Rules, and then choose Edit web ACL.
6. For Rules, choose a rule or rule group, and then choose Add rule to web ACL.
7. At this point, you can modify the rule order within the web ACL if you are adding multiple rules or rule groups to the web ACL.
8. Choose **Update**.
## Description

This control checks whether an AWS WAF Classic Regional web ACL contains any WAF rules or WAF rule groups. This control fails if a web ACL does not contain any WAF rules or rule groups.

A WAF Regional web ACL can contain a collection of rules and rule groups that inspect and control web requests. If a web ACL is empty, the web traffic can pass without being detected or acted upon by WAF depending on the default action.

## Remediation

To add rules or rule groups to an empty Classic Regional web ACL, see [Editing a Web ACL](https://docs.aws.amazon.com/waf/latest/developerguide/classic-web-acl-editing.html) in the AWS WAF Developer Guide.
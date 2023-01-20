## Description

This control checks whether a WAFV2 web access control list (web ACL) contains at least one WAF rule or WAF rule group. The control fails if a web ACL does not contain any WAF rules or rule groups.

A web ACL gives you fine-grained control over all of the HTTP(S) web requests that your protected resource responds to. A web ACL should contain a collection of rules and rule groups that inspect and control web requests. If a web ACL is empty, the web traffic can pass without being detected or acted upon by WAF depending on the default action.

## Remediation

To add rules or rule groups to an empty WAFV2 web ACL, see [Editing a Web ACL](https://docs.aws.amazon.com/waf/latest/developerguide/web-acl-editing.html) in the AWS WAF Developer Guide.
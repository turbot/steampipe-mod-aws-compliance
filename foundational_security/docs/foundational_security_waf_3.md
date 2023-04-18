## Description

This control checks whether an AWS WAF Regional rule group has at least one rule. The control fails if no rules are present within a rule group.

A WAF Regional rule group can contain multiple rules. The rule's conditions allow for traffic inspection and take a defined action (allow, block, or count). Without any rules, the traffic passes without inspection. A WAF Regional rule group with no rules, but with a name or tag suggesting allow, block, or count, could lead to the wrong assumption that one of those actions is occurring.

## Remediation

To add rules and rule conditions to an empty rule group, see [Adding and deleting rules from an AWS WAF Classic rule group](https://docs.aws.amazon.com/waf/latest/developerguide/classic-rule-group-editing.html) and [Adding and removing conditions in a rule](https://docs.aws.amazon.com/waf/latest/developerguide/classic-web-acl-rules-editing.html) in the AWS WAF Developer Guide.
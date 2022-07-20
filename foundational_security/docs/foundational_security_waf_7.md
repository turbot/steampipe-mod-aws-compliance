## Description

This control checks whether an AWS WAF global rule group has at least one rule. The control fails if no rules are present within a rule group.

A WAF global rule group can contain multiple rules. The rule's conditions allow for traffic inspection and take a defined action (allow, block, or count). Without any rules, the traffic passes without inspection. A WAF global rule group with no rules, but with a name or tag suggesting allow, block, or count, could lead to the wrong assumption that one of those actions is occurring.

## Remediation

To remediate this issue, update your WAF rule group to add atleast one rule.

**To encrypt an unencrypted SNS topic**

1. Open the [Amazon WAF console](https://console.aws.amazon.com/wafv2/).
2. In the navigation pane, choose `Rule groups`.
3. Choose the name of the rule group to update.
4. Choose `Edit`.
5. If you have already created the rules that you want to add to the rule group, choose Use existing rules for this rule group . If you want to create new rules to add to the rule group, choose **Create rules and conditions for this rule group**.
6. Choose Next.
7. If you chose to create rules, follow the steps to create them at [Creating a rule and adding conditions](https://docs.aws.amazon.com/waf/latest/developerguide/classic-web-acl-rules-creating.html).
   When you've created all the rules you need, go to the next step.
8. To add a rule to the rule group, select a rule then choose Add rule. Choose whether to allow, block, or count requests that match the rule's conditions. For more information on the choices, see [How AWS WAF Classic works](https://docs.aws.amazon.com/waf/latest/developerguide/classic-how-aws-waf-works.html).
9. When you're finished adding conditions, choose **Save**.
## Description

This control checks whether an AWS WAF global rule contains any conditions. The control fails if no conditions are present within a rule.

A WAF global rule can contain multiple conditions. A rule’s conditions allow for traffic inspection and take a defined action (allow, block, or count). Without any conditions, the traffic passes without inspection. A WAF global rule with no conditions, but with a name or tag suggesting allow, block, or count, could lead to the wrong assumption that one of those actions is occurring.

## Remediation

To remediate this issue, update your WAF rule to add a condition.

**To encrypt an unencrypted SNS topic**

1. Open the [Amazon WAF console](https://console.aws.amazon.com/wafv2/).
2. In the navigation pane, choose `Rules`.
3. Choose the name of the rule to update.
4. Choose `Edit`.
5. To add a condition to the rule, specify the following values:

  **When a request does/does not**

    If you want AWS WAF Classic to allow or block requests based on the filters in a condition, choose does. For example, if an IP match condition includes the IP address range 192.0.2.0/24 and you want AWS WAF Classic to allow or block requests that come from those IP addresses, choose does.
    If you want AWS WAF Classic to allow or block requests based on the inverse of the filters in a condition, choose does not. For example, if an IP match condition includes the IP address range 192.0.2.0/24 and you want AWS WAF Classic to allow or block requests that do not come from those IP addresses, choose does not.

  **match/originate from**

    Choose the type of condition that you want to add to the rule:
    - Cross-site scripting match conditions – choose **match at least one of the filters in the cross-site scripting match condition**
    - IP match conditions – choose **originate from an IP address in**
    - Geo match conditions – choose **originate from a geographic location in**
    - Size constraint conditions – choose **match at least one of the filters in the size constraint condition**
    - SQL injection match conditions – choose **match at least one of the filters in the SQL injection match condition**
    - String match conditions – choose **match at least one of the filters in the string match condition**
    - Regular expression **match conditions – choose match at least one of the filters in the regex match condition**

  **condition name**

    Choose the condition that you want to add to the rule. The list displays only conditions of the type that you chose in the preceding step.

6. To add another condition to the rule, choose **Add another condition**, and repeat steps 4 and 5. Note the following:
  - If you add more than one condition, a web request must match at least one filter in every condition for AWS WAF Classic to allow or block requests based on that rule
  - If you add two IP match conditions to the same rule, AWS WAF Classic will only allow or block requests that originate from IP addresses that appear in both IP match conditions
7. When you're finished adding conditions, choose **Create**.
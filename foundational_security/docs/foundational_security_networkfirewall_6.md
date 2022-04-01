## Description

This control checks if a Stateless Network Firewall Rule Group contains rules. The rule will fail if there are no rules in a Stateless Network Firewall Rule Group.

A rule group contains rules that define how your firewall processes traffic in your VPC. An empty stateless rule group when present in a firewall policy might give the impression that the rule group will process traffic. However, when the stateless rule group is empty, it does not process traffic.

## Remediation

**To update rule group and add a rule through console:**

1. Sign in to the AWS Management Console and open the [Amazon VPC console](https://console.aws.amazon.com/vpc/).
2. In the navigation pane, under `Network Firewall`, choose `Network Firewall rule groups`.
3. In the `Network Firewall rule groups` page, choose the name of the firewall rule group that you want to edit. This takes you to the firewall rule groups details page.
4. For stateless rule groups, choose `Edit Rules` to add rules to the rule group.

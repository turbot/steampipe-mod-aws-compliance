## Description

This control checks whether the default stateless action for full packets for a Network Firewall policy is drop or forward. The control passes if Drop or Forward is selected, and fails if Pass is selected.

A firewall policy defines how your firewall monitors and handles traffic in Amazon VPC. You configure stateless and stateful rule groups to filter packets and traffic flows. Defaulting to Pass can allow unintended traffic.

## Remediation

**To update firewall policy and update actions through console:**

1. Sign in to the AWS Management Console and open the [Amazon VPC console](https://console.aws.amazon.com/vpc/).
2. In the navigation pane, under Network Firewall, choose Firewall policies.
3. Select the name of the firewall policy that you want to edit. This takes you to the firewall policy’s details page.
4. In Stateless Default Actions, choose Edit. Then choose Drop or Forward to stateful rule groups as the Default actions for full packets.

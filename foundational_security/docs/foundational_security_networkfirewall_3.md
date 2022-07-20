## Description

This control checks whether a Network Firewall policy has any stateful or stateless rule groups associated. The control fails if stateless or stateful rule groups are not assigned.

A firewall policy defines how your firewall monitors and handles traffic in Amazon Virtual Private Cloud (Amazon VPC). Configuration of stateless and stateful rule groups helps to filter packets and traffic flows, and defines default traffic handling

## Remediation

**To update firewall policy and add a rule group through console:**

1. Sign in to the AWS Management Console and open the Amazon VPC console at https://console.aws.amazon.com/vpc/.
2. In the navigation pane, under Network Firewall, choose Firewall policies.
3. In the Firewall policies page, select the name of the firewall policy you want to update.
4. In the firewall policy's page, you can change the rule groups.
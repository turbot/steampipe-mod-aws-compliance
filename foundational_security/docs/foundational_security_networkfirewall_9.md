## Description

This control checks whether an AWS Network Firewall firewall has deletion protection enabled. The control fails if deletion protection isn't enabled for a firewall.

AWS Network Firewall is a stateful, managed network firewall and intrusion detection service that enables you to inspect and filter traffic to, from, or between your Virtual Private Clouds (VPCs). The deletion protection setting protects against accidental deletion of the firewall.

## Remediation

To enable delete protection on an existing Network Firewall firewall, see [Updating a firewall](https://docs.aws.amazon.com/network-firewall/latest/developerguide/firewall-updating.html) in the AWS Network Firewall Developer Guide. For Change protections, select Enable. You can also enable deletion protection by invoking the [UpdateFirewallDeleteProtection](https://docs.aws.amazon.com/network-firewall/latest/APIReference/API_UpdateFirewallDeleteProtection.html) API and setting the DeleteProtection field to true.

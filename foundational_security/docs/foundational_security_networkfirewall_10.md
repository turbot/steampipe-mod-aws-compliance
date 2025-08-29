## Description

This control checks whether subnet change protection is enabled for an AWS Network Firewall firewall. The control fails if subnet change protection isn't enabled for the firewall.

AWS Network Firewall is a stateful, managed network firewall and intrusion detection service that you can use to inspect and filter traffic to, from, or between your Virtual Private Clouds (VPCs). If you enable subnet change protection for a Network Firewall firewall, you can protect the firewall against accidental changes to the firewall's subnet associations.

## Remediation

For information about enabling subnet change protection for an existing Network Firewall firewall, see [Updating a firewall](https://docs.aws.amazon.com/network-firewall/latest/developerguide/firewall-updating.html) in the AWS Network Firewall Developer Guide.
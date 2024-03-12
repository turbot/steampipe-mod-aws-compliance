## Description

This control checks whether logging is enabled for an AWS Network Firewall firewall. The control fails if logging isn't enabled for at least one log type or if the logging destination doesn't exist.

Logging helps you maintain the reliability, availability, and performance of your firewalls. In Network Firewall, logging gives you detailed information about network traffic, including the time that the stateful engine received a packet flow, detailed information about the packet flow, and any stateful rule action taken against the packet flow.

## Remediation

To enable logging for a firewall, see [Updating a firewall's logging configuration](https://docs.aws.amazon.com/network-firewall/latest/developerguide/firewall-update-logging-configuration.html) in the AWS Network Firewall Developer Guide.
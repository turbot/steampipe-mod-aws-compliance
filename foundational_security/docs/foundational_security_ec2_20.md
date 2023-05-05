## Description

A VPN tunnel is an encrypted link where data can pass from the customer network to or from AWS within an AWS Site-to-Site VPN connection. Each VPN connection includes two VPN tunnels which you can simultaneously use for high availability. Ensuring that both VPN tunnels are up for a VPN connection is important for confirming a secure and highly available connection between an AWS VPC and your remote network.

This control checks that both VPN tunnels provided by AWS Site-to-Site VPN are in UP status. The control fails if one or both tunnels are in DOWN status.

## Remediation

To modify VPN tunnel options, see [Modifying Site-to-Site VPN tunnel options](https://docs.aws.amazon.com/vpn/latest/s2svpn/modify-vpn-tunnel-options.html) in the AWS Site-to-Site VPN User Guide.
## Description

This control checks whether an AWS Site-to-Site VPN connection has Amazon CloudWatch Logs enabled for both tunnels. The control fails if a Site-to-Site VPN connection doesn't have CloudWatch Logs enabled for both tunnels.

AWS Site-to-Site VPN logs provide you with deeper visibility into your Site-to-Site VPN deployments. With this feature, you have access to Site-to-Site VPN connection logs that provide details on IP Security (IPsec) tunnel establishment, Internet Key Exchange (IKE) negotiations, and dead peer detection (DPD) protocol messages. Site-to-Site VPN logs can be published to CloudWatch Logs. This feature provides customers with a single consistent way to access and analyze detailed logs for all of their Site-to-Site VPN connections.

## Remediation

To enable tunnel logging on an EC2 VPN connection, see [AWS Site-to-Site VPN logs](https://docs.aws.amazon.com/vpn/latest/s2svpn/monitoring-logs.html#enable-logs) in the AWS Site-to-Site VPN User Guide.
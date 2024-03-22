## Description

This control checks if DNS query logging is enabled for an Amazon Route 53 public hosted zone. The control fails if DNS query logging isn't enabled for a Route 53 public hosted zone.

Logging DNS queries for a Route 53 hosted zone addresses DNS security and compliance requirements and grants visibility. The logs include information such as the domain or subdomain that was queried, the date and time of the query, the DNS record type (for example, A or AAAA), and the DNS response code (for example, NoError or ServFail). When DNS query logging is enabled, Route 53 publishes the log files to Amazon CloudWatch Logs.

## Remediation

To log DNS queries for Route 53 public hosted zones, see [Configuring logging for DNS queries](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html#query-logs-configuring) in the Amazon Route 53 Developer Guide.
## Description

This control checks whether a Classic Load Balancer is configured with defensive or strictest desync mitigation mode. This control will fail if the Classic Load Balancer is not configured with defensive or strictest desync mitigation mode.

HTTP Desync issues can lead to request smuggling and make applications vulnerable to request queue or cache poisoning. In turn, these vulnerabilities can lead to credential hijacking or execution of unauthorized commands. Classic Load Balancers configured with defensive or strictest desync mitigation mode protect your application from security issues that may be caused by HTTP Desync.

## Remediation

To update desync mitigation mode of a Classic Load Balancer, see [Modify desync mitigation mode](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-desync-mitigation-mode.html#update-desync-mitigation-mode) in the User Guide for Classic Load Balancers.
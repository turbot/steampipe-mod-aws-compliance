## Description

This control checks whether a Classic Load Balancer has been configured to span multiple Availability Zones. The control fails if the Classic Load Balancer does not span multiple Availability Zones.

A Classic Load Balancer can be set up to distribute incoming requests across Amazon EC2 instances in a single Availability Zone or multiple Availability Zones. A Classic Load Balancer that does not span multiple Availability Zones is unable to redirect traffic to targets in another Availability Zone if the sole configured Availability Zone becomes unavailable.

## Remediation

For information on how to add Availability Zones to a Classic Load Balancer, see [Add or remove Availability Zones](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html) in the User Guide for Classic Load Balancers.
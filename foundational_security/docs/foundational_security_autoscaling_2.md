## Description

This control checks whether an Auto Scaling group spans multiple Availability Zones. The control fails if an Auto Scaling group does not span multiple availability zones.

Amazon EC2 Auto Scaling groups can be configured to use multiple Availability Zones. An Auto Scaling group with a single Availability Zone is preferred in some use cases, such as batch-jobs or when inter-AZ transfer costs need to be kept to a minimum. However, an Auto Scaling group that does not span multiple Availability Zones will not launch instances in another Availability Zone to compensate if the configured single Availability Zone becomes unavailable.

## Remediation

For information on how to add Availability Zones to an existing auto scaling group, see [Availability zones](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-add-availability-zone.html)in Amazon EC2 Auto Scaling user guide.
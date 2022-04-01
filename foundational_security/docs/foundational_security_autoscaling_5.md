## Description

This control checks whether an Auto Scaling groups associated launch configuration assigns a [public IP address](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#public-ip-addresses) to the group’s instances.

Amazon EC2 instances in an autoscaling group launch configuration should not have an associated public IP address, except for in limited edge cases. Amazon EC2 instances should only be accessible from behind a load balancer instead of being directly exposed to the internet.

This control passes if the associated launch configuration is configured to assign a public IP address. This control fails if the associated launch configuration is not configured to assign a public IP address.

## Remediation

An Auto Scaling group is associated with one launch configuration at a time. You cannot modify a launch configuration after you have create it. To change the launch configuration for an Auto Scaling group, use an existing launch configuration as the basis for a new launch configuration. Then, update the Auto Scaling group to use the new launch configuration as described in steps below.

After you change the launch configuration for an Auto Scaling group, any new instances are launched with the new configuration options. Existing instances are not affected. To update existing instances, either terminate them so that they are replaced by your Auto Scaling group, or allow automatic scaling to gradually replace older instances with newer instances based on your termination policies.

**To enable Elastic Load Balancing health checks**

1. Open the [Amazon EC2 console](https://console.aws.amazon.com/ec2/).
2. In the navigation pane, under `Auto Scaling`, choose `Launch Configurations`.
3. Select the launch configuration and choose Actions, then Copy launch configuration. This sets up a new launch configuration with the same options as the original, but with "Copy" added to the name.
4. On the `Create Launch Configuration` page, expand `Advanced details` under `Additional configuration - optional`.
5. Under `IP address type`, choose `Do not assign a public IP address to any instances`.
6. When you have finished, Choose `Create launch configuration`.
7. On the navigation pane, under `Auto Scaling`, choose `Auto Scaling Groups`.
8. Select the check box next to the Auto Scaling group.
9. A split pane opens up in the bottom part of the page, showing information about the group that's selected.
10. On the `Details` tab, choose `Launch configuration`, `Edit`.
11. For `Launch configuration`, select the new launch configuration.
12. When you have finished changing your launch configuration, choose `Update`.
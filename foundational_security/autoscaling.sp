locals {
  foundational_security_autoscaling_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/AutoScaling"
  })
}

benchmark "foundational_security_autoscaling" {
  title         = "Auto Scaling"
  documentation = file("./foundational_security/docs/foundational_security_autoscaling.md")
  children = [
    control.foundational_security_autoscaling_1,
    control.foundational_security_autoscaling_2,
    control.foundational_security_autoscaling_5
  ]
  tags          = local.foundational_security_autoscaling_common_tags
}

control "foundational_security_autoscaling_1" {
  title         = "1 Auto Scaling groups associated with a load balancer should use load balancer health checks"
  description   = "This control checks whether your Auto Scaling groups that are associated with a load balancer are using Elastic Load Balancing health checks. This ensures that the group can determine an instance's health based on additional tests provided by the load balancer. Using Elastic Load Balancing health checks can help support the availability of applications that use EC2 Auto Scaling groups."
  severity      = "low"
  sql           = query.autoscaling_group_with_lb_use_health_check.sql
  documentation = file("./foundational_security/docs/foundational_security_autoscaling_1.md")

  tags = merge(local.foundational_security_autoscaling_common_tags, {
    foundational_security_item_id  = "autoscaling_1"
    foundational_security_category = "inventory"
  })
}

control "foundational_security_autoscaling_2" {
  title         = "2 Amazon EC2 Auto Scaling group should cover multiple Availability Zones"
  description   = "This control checks whether an Auto Scaling group spans multiple Availability Zones. The control fails if an Auto Scaling group does not span multiple availability zones."
  severity      = "medium"
  sql           = query.autoscaling_group_multiple_az_configured.sql
  documentation = file("./foundational_security/docs/foundational_security_autoscaling_2.md")

  tags = merge(local.foundational_security_autoscaling_common_tags, {
    foundational_security_item_id  = "autoscaling_2"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_autoscaling_5" {
  title         = "5 Amazon EC2 instances launched using Auto Scaling group launch configurations should not have Public IP addresses"
  description   = "This control checks whether an Auto Scaling groups associated launch configuration assigns a public IP address to the group’s instances."
  severity      = "high"
  sql           = query.autoscaling_launch_config_public_ip_disabled.sql
  documentation = file("./foundational_security/docs/foundational_security_autoscaling_5.md")

  tags = merge(local.foundational_security_autoscaling_common_tags, {
    foundational_security_item_id  = "autoscaling_5"
    foundational_security_category = "secure_network_configuration"
  })
}

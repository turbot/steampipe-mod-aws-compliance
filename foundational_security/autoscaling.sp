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
    control.foundational_security_autoscaling_3,
    control.foundational_security_autoscaling_4,
    control.foundational_security_autoscaling_5
  ]

  tags = merge(local.foundational_security_autoscaling_common_tags, {
    type = "Benchmark"
  })
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

control "foundational_security_autoscaling_3" {
  title         = "3 Auto Scaling group should configure EC2 instances to require Instance Metadata Service Version 2 (IMDSv2)"
  description   = "This control checks whether IMDSv2 is enabled on all instances launched by Amazon EC2 Auto Scaling groups. The control fails if the Instance Metadata Service (IMDS) version is not included in the launch configuration or if both IMDSv1 and IMDSv2 are enabled."
  severity      = "high"
  sql           = query.autoscaling_launch_config_requires_imdsv2.sql
  documentation = file("./foundational_security/docs/foundational_security_autoscaling_3.md")

  tags = merge(local.foundational_security_autoscaling_common_tags, {
    foundational_security_item_id  = "autoscaling_3"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_autoscaling_4" {
  title         = "4 Auto Scaling group launch configuration should not have metadata response hop limit greater than 1"
  description   = "This control checks the number of network hops that a metadata token can travel. The control fails if the metadata response hop limit is greater than 1."
  severity      = "high"
  sql           = query.autoscaling_launch_config_hop_limit.sql
  documentation = file("./foundational_security/docs/foundational_security_autoscaling_4.md")

  tags = merge(local.foundational_security_autoscaling_common_tags, {
    foundational_security_item_id  = "autoscaling_4"
    foundational_security_category = "secure_network_configuration"
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

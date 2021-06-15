locals {
  conformance_pack_autoscaling_common_tags = {
    service = "autoscaling"
  }
}

control "autoscaling_group_with_lb_use_health_check" {
  title       = "Auto Scaling groups with a load balancer should use health checks"
  description = "The Elastic Load Balancer (ELB) health checks for Amazon Elastic Compute Cloud (Amazon EC2) Auto Scaling groups support maintenance of adequate capacity and availability."
  sql         = query.autoscaling_group_with_lb_use_health_check.sql
  tags        = local.conformance_pack_autoscaling_common_tags
}

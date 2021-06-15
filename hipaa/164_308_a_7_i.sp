locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_7_i"
  })
}

benchmark "hipaa_164_308_a_7_i" {
  title       = "164.308(a)(7)(i) Contingency plan"
  description = "Establish (and implement as needed) policies and procedures for responding to an emergency or other occurrence (for example, fire, vandalism, system failure, and natural disaster) that damages systems that contain electronic protected health information."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    #control.vpc_vpn_tunnel_up
  ]
  tags          = local.common_tags
}

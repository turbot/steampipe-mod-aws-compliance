locals {
  hipaa_164_308_a_7_i_common_tags = merge(local.hipaa_common_tags, {
    service = "164_308_a_7_i"
  })
}

benchmark "hipaa_164_308_a_7_i" {
  title         = "164.308(a)(7)(i)"
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_i.md")
  children = [
    control.hipaa_164_308_a_7_i_autoscaling_group_with_lb_use_healthcheck,
    control.hipaa_164_308_a_7_i_dynamodb_table_auto_scaling_enabled,
    control.hipaa_164_308_a_7_i_rds_db_instance_multiple_az_enabled,
    control.hipaa_164_308_a_7_i_s3_bucket_cross_region_replication_enabled,
  ]
  tags          = local.hipaa_164_308_a_7_i_common_tags
}

control "hipaa_164_308_a_7_i_autoscaling_group_with_lb_use_healthcheck" {
  title         = "AutoScaling group with lb should use healthcheck"
  description   = "The Elastic Load Balancer (ELB) health checks for Amazon Elastic Compute Cloud (Amazon EC2) Auto Scaling groups support maintenance of adequate capacity and availability."
  sql           = query.autoscaling_group_with_lb_use_healthcheck.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_i_autoscaling_group_with_lb_use_healthcheck.md")

  tags = merge(local.hipaa_164_308_a_7_i_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_7_i_autoscaling_group_with_lb_use_healthcheck"
  })
}

control "hipaa_164_308_a_7_i_dynamodb_table_auto_scaling_enabled" {
  title         = "Dynamodb table auto scaling should be enabled"
  description   = "Amazon DynamoDB auto scaling uses the AWS Application Auto Scaling service to adjust provisioned throughput capacity that automatically responds to actual traffic patterns."
  sql           = query.dynamodb_table_auto_scaling_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_i_dynamodb_table_auto_scaling_enabled.md")

  tags = merge(local.hipaa_164_308_a_7_i_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_7_i_dynamodb_table_auto_scaling_enabled"
  })
}

control "hipaa_164_308_a_7_i_rds_db_instance_multiple_az_enabled" {
  title         = "RDS DB instances multiple az should be enabled"
  description   = "Multi-AZ support in Amazon Relational Database Service (Amazon RDS) provides enhanced availability and durability for database instances."
  sql           = query.rds_db_instance_multiple_az_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_i_rds_db_instance_multiple_az_enabled.md")

  tags = merge(local.hipaa_164_308_a_7_i_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_7_i_rds_db_instance_multiple_az_enabled"
  })
}

control "hipaa_164_308_a_7_i_s3_bucket_cross_region_replication_enabled" {
  title         = "S3 bucket cross region replication should be enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) Cross-Region Replication (CRR) supports maintaining adequate capacity and availability."
  sql           = query.s3_bucket_cross_region_replication_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_7_i_s3_bucket_cross_region_replication_enabled.md")

  tags = merge(local.hipaa_164_308_a_7_i_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_7_i_s3_bucket_cross_region_replication_enabled"
  })
}
locals {
  soc_2_cc_a_1_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cca1"
  })
}

benchmark "soc_2_cc_a_1" {
  title       = "CCA1.0 - Additional Criterial for Availability"
  description = "The availability category refers to the accessibility of information used by the entity’s systems, as well as the products or services provided to its customers."

  children = [
    benchmark.soc_2_cc_a_1_1,
    benchmark.soc_2_cc_a_1_2,
    benchmark.soc_2_cc_a_1_3
  ]

  tags = local.soc_2_cc_a_1_common_tags
}

benchmark "soc_2_cc_a_1_1" {
  title         = "A1.1 The entity maintains, monitors, and evaluates current processing capacity and use of system components (infrastructure, data, and software) to manage capacity demand and to enable the implementation of additional capacity to help meet its objectives"
  documentation = file("./soc2/docs/cc_a_1_1.md")

  children = [
    control.manual_control
  ]

  tags = merge(local.soc_2_cc_a_1_common_tags, {
    soc_2_item_id = "a1.1"
    soc_2_type    = "manual"
  })
}

benchmark "soc_2_cc_a_1_2" {
  title       = "A1.2 The entity authorizes, designs, develops or acquires, implements, operates, approves, maintains, and monitors environmental protections, software, data back-up processes, and recovery infrastructure to meet its objectives"
  documentation = file("./soc2/docs/cc_a_1_2.md")

  children = [
    control.s3_bucket_versioning_enabled,
    control.efs_file_system_in_backup_plan,
    control.rds_db_instance_in_backup_plan,
    control.apigateway_stage_logging_enabled,
    control.dynamodb_table_in_backup_plan,
    control.cloudtrail_multi_region_trail_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.ebs_volume_in_backup_plan,
    control.rds_db_instance_logging_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.ec2_instance_ebs_optimized,
    control.wafv2_web_acl_logging_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.cloudtrail_trail_enabled,
    control.rds_db_instance_backup_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_cluster_aurora_protected_by_backup_plan
  ]

  tags = merge(local.soc_2_cc_a_1_common_tags, {
    soc_2_item_id = "a1.2"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_a_1_3" {
  title       = "A1.3 The entity tests recovery plan procedures supporting system recovery to meet its objectives"
  documentation = file("./soc2/docs/cc_a_1_3.md")

  children = [
  ]

  tags = merge(local.soc_2_cc_a_1_common_tags, {
    soc_2_item_id = "a1.3"
    soc_2_type    = "automated"
  })
}
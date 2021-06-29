benchmark "nist_cyber_security_id_be_5" {
  title       = "ID.BE-5"
  description = "Resilience requirements to support delivery of critical services are established for all operating states (e.g. under duress/attack, during recovery, normal operations)"

  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "id_be_5"
  })
}

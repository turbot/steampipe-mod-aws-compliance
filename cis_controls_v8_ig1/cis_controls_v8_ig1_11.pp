benchmark "cis_controls_v8_ig1_11" {
  title       = "11 Data Recovery"
  description = "Establish and maintain data recovery practices sufficient to restore in-scope enterprise assets to a pre-incident and trusted state."
  children = [
    benchmark.cis_controls_v8_ig1_11_2,
    benchmark.cis_controls_v8_ig1_11_3,
    benchmark.cis_controls_v8_ig1_11_4
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_11_2" {
  title       = "11.2 Perform Automated Backups"
  description = "Perform automated backups of in-scope enterprise assets. Run backups weekly, or more frequently, based on the sensitivity of the data."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_maintenance_settings_check,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_11_3" {
  title       = "11.3 Protect Recovery Data"
  description = "Protect recovery data with equivalent controls to the original data. Reference encryption or data separation, based on requirements."
  children = [
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.rds_db_instance_encryption_at_rest_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_11_4" {
  title       = "11.4 Establish and Maintain an Isolated Instance of Recovery Data"
  description = "Establish and maintain an isolated instance of recovery data. Example implementations include, version controlling backup destinations through offline, cloud, or off-site systems or services."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_maintenance_settings_check,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

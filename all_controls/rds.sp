locals {
  all_controls_rds_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/RDS"
  })
}

benchmark "all_controls_rds" {
  title       = "RDS"
  description = "This section contains recommendations for configuring RDS resources."
  children = [
    control.rds_db_cluster_aurora_backtracking_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_cluster_copy_tags_to_snapshot_enabled,
    control.rds_db_cluster_deletion_protection_enabled,
    control.rds_db_cluster_encryption_at_rest_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_cluster_multiple_az_enabled,
    control.rds_db_cluster_no_default_admin_name,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_and_cluster_no_default_port,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_ca_certificate_expires_7_days,
    control.rds_db_instance_cloudwatch_logs_enabled,
    control.rds_db_instance_connections_encryption_enabled,
    control.rds_db_instance_copy_tags_to_snapshot_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_iam_authentication_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_in_vpc,
    control.rds_db_instance_logging_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_no_default_admin_name,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_instance_protected_by_backup_plan,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.rds_db_snapshot_encrypted_at_rest,
    control.rds_db_snapshot_prohibit_public_access,
    control.rds_db_cluster_aurora_postgres_not_exposed_to_local_file_read_vulnerability,
  ]

  tags = merge(local.all_controls_rds_common_tags, {
    type = "Benchmark"
  })
}

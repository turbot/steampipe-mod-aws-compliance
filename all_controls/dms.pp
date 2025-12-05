locals {
  all_controls_dms_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/DMS"
  })
}

benchmark "all_controls_dms" {
  title       = "DMS"
  description = "This section contains recommendations for configuring DMS resources."
  children = [
    control.dms_certificate_not_expired,
    control.dms_endpoint_mongo_db_authentication_enabled,
    control.dms_endpoint_neptune_database_iam_authorization_enabled,
    control.dms_endpoint_redis_tls_enabled,
    control.dms_endpoint_ssl_configured,
    control.dms_replication_instance_automatic_minor_version_upgrade_enabled,
    control.dms_replication_instance_multiple_az_enabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled
  ]

  tags = merge(local.all_controls_dms_common_tags, {
    type = "Benchmark"
  })
}

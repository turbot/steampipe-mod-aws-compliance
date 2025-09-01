locals {
  all_controls_redshift_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Redshift"
  })
}

benchmark "all_controls_redshift" {
  title       = "Redshift"
  description = "This section contains recommendations for configuring Redshift resources."
  children = [
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_automatic_upgrade_major_versions_enabled,
    control.redshift_cluster_encrypted_with_cmk,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_kms_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.redshift_cluster_multiple_az_enabled,
    control.redshift_cluster_no_default_admin_name,
    control.redshift_cluster_no_default_database_name,
    control.redshift_cluster_prohibit_public_access,
    control.redshift_cluster_security_group_restrict_ingress_redshift_port
  ]

  tags = merge(local.all_controls_redshift_common_tags, {
    type = "Benchmark"
  })
}

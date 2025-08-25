locals {
  all_controls_emr_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/EMR"
  })
}

benchmark "all_controls_emr" {
  title       = "EMR"
  description = "This section contains recommendations for configuring EMR resources."
  children = [
    control.emr_account_public_access_blocked,
    control.emr_cluster_encryption_at_rest_enabled,
    control.emr_cluster_encryption_at_rest_with_cse_cmk,
    control.emr_cluster_encryption_at_rest_with_sse_kms,
    control.emr_cluster_encryption_in_transit_enabled,
    control.emr_cluster_kerberos_enabled,
    control.emr_cluster_local_disk_encrypted_with_cmk,
    control.emr_cluster_local_disk_encryption_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.emr_cluster_security_configuration_enabled,
    control.emr_security_configuration_encryption_at_rest_enabled,
    control.emr_security_configuration_encryption_in_transit_enabled
  ]

  tags = merge(local.all_controls_emr_common_tags, {
    type = "Benchmark"
  })
}

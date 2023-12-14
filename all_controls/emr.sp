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
    control.emr_cluster_kerberos_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.emr_cluster_security_configuration_enabled
  ]

  tags = merge(local.all_controls_emr_common_tags, {
    type = "Benchmark"
  })
}

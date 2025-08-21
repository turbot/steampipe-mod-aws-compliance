locals {
  all_controls_fsx_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/FSx"
  })
}

benchmark "all_controls_fsx" {
  title       = "FSx"
  description = "This section contains recommendations for configuring FSx resources."
  children = [
    control.fsx_file_system_copy_tags_to_backup_and_volume_enabled,
    control.fsx_file_system_protected_by_backup_plan,
    control.fsx_lustre_file_system_copy_tags_to_backup_enabled,
    control.fsx_netapp_ontap_file_system_multi_az_deployment_enabled,
    control.fsx_openzfs_file_system_multi_az_deployment_enabled,
    control.fsx_windows_file_system_multi_az_deployment_enabled
  ]

  tags = merge(local.all_controls_fsx_common_tags, {
    type = "Benchmark"
  })
}

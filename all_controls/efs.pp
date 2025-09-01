locals {
  all_controls_efs_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/EFS"
  })
}

benchmark "all_controls_efs" {
  title       = "EFS"
  description = "This section contains recommendations for configuring EFS resources."
  children = [
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.efs_file_system_encrypt_data_at_rest,
    control.efs_file_system_encrypted_with_cmk,
    control.efs_file_system_enforces_ssl,
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.efs_file_system_restrict_public_access,
    control.efs_mount_target_not_publicly_accessible
  ]

  tags = merge(local.all_controls_efs_common_tags, {
    type = "Benchmark"
  })
}

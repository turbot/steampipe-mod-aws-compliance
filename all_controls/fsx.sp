locals {
  all_controls_fsx_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/FSx"
  })
}

benchmark "all_controls_fsx" {
  title       = "FSx"
  description = "This section contains recommendations for configuring FSx resources."
  children = [
    control.fsx_file_system_protected_by_backup_plan
  ]

  tags = merge(local.all_controls_fsx_common_tags, {
    type = "Benchmark"
  })
}

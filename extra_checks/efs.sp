locals {
  extra_checks_efs_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_efs" {
  title       = "EFS"
  description = "This benchmark contains additional checks for AWS EFS service, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.efs_file_system_encrypted_with_cmk,
    control.efs_file_system_enforces_ssl
  ]

  tags = local.extra_checks_efs_common_tags
}


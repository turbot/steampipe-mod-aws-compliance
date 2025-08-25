locals {
  all_controls_athena_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Athena"
  })
}

benchmark "all_controls_athena" {
  title       = "Athena"
  description = "This section contains recommendations for configuring Athena resources."
  children = [
    control.athena_workgroup_encryption_at_rest_enabled,
    control.athena_workgroup_enforce_configuration_enabled,
    control.athena_workgroup_logging_enabled
  ]

  tags = merge(local.all_controls_athena_common_tags, {
    type = "Benchmark"
  })
}

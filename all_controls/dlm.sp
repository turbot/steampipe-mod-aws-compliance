locals {
  all_controls_dlm_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/DLM"
  })
}

benchmark "all_controls_dlm" {
  title       = "DLM"
  description = "This section contains recommendations for configuring DLM resources."
  children = [
    control.dlm_ebs_snapshot_lifecycle_policy_enabled
  ]

  tags = merge(local.all_controls_dlm_common_tags, {
    type = "Benchmark"
  })
}

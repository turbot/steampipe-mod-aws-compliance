locals {
  all_controls_workspaces_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/WorkSpaces"
  })
}

benchmark "all_controls_workspaces" {
  title       = "WorkSpaces"
  description = "This section contains recommendations for configuring WorkSpaces resources."
  children = [
    control.workspaces_workspace_root_volume_encryption_enabled,
    control.workspaces_workspace_user_volume_encryption_enabled,
    control.workspaces_workspace_volume_encryption_enabled
  ]

  tags = merge(local.all_controls_workspaces_common_tags, {
    type = "Benchmark"
  })
}

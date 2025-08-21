locals {
  foundational_security_workspaces_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/WorkSpaces"
  })
}

benchmark "foundational_security_workspaces" {
  title         = "WorkSpaces"
  documentation = file("./foundational_security/docs/foundational_security_workspaces.md")
  children = [
    control.foundational_security_workspaces_1,
    control.foundational_security_workspaces_2
  ]

  tags = merge(local.foundational_security_workspaces_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_workspaces_1" {
  title         = "1 WorkSpaces user volumes should be encrypted at rest"
  description   = "This control checks whether a user volume in an Amazon WorkSpaces WorkSpace is encrypted at rest. The control fails if the WorkSpace user volume isn't encrypted at rest."
  severity      = "medium"
  query         = query.workspaces_workspace_user_volume_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_workspaces_1.md")

  tags = merge(local.foundational_security_workspaces_common_tags, {
    foundational_security_item_id  = "workspaces_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_workspaces_2" {
  title         = "2 WorkSpaces root volumes should be encrypted at rest"
  description   = "This control checks whether a root volume in an Amazon WorkSpaces WorkSpace is encrypted at rest. The control fails if the WorkSpace root volume isn't encrypted at rest."
  severity      = "medium"
  query         = query.workspaces_workspace_root_volume_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_workspaces_2.md")

  tags = merge(local.foundational_security_workspaces_common_tags, {
    foundational_security_item_id  = "workspaces_2"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

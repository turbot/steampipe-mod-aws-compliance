locals {
  conformance_pack_workspaces_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/WorkSpaces"
  })
}

control "workspaces_workspace_volume_encryption_enabled" {
  title       = "WorkSpaces root and user volume encryption should be enabled"
  description = "To help protect data at rest, ensure encryption is enabled for your WorkSpaces root and user volumes."
  query       = query.workspaces_workspace_volume_encryption_enabled

  tags = merge(local.conformance_pack_workspaces_common_tags, {
    other_checks = "true"
  })
}

query "workspaces_workspace_volume_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when user_volume_encryption_enabled and root_volume_encryption_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when user_volume_encryption_enabled and root_volume_encryption_enabled then title || ' user and root volume encryption enabled.'
        else
          case
            when not user_volume_encryption_enabled and not root_volume_encryption_enabled then title || ' user and root volume encryption disabled.'
            when not root_volume_encryption_enabled then title || ' root volume encryption disabled.'
            else  title || ' user volume encryption disabled.'
          end
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_workspaces_workspace;
  EOQ
}
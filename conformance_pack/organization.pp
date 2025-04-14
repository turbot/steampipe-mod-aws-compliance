locals {
  conformance_pack_organization_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Organizations"
  })
}

control "organizational_tag_policies_enabled" {
  title       = "Ensure Tag Policies are enabled"
  description = "Tag policies help you standardize tags on all tagged resources across your organization"
  query       = query.organizational_tag_policies_enabled

  tags = local.conformance_pack_organization_common_tags
}

query "organizational_tag_policies_enabled" {
  sql = <<-EOQ
    with tag_policy_enabled as (
      select
        _ctx,
        account_id,
        count(*) as count
      from
        aws_organizations_policy
      where
        type = 'TAG_POLICY'
      group by
        _ctx,
        account_id
    )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'Organizational tag policies are enabled.'
        else 'Organizational tag policies are disabled.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      tag_policy_enabled;
  EOQ
}
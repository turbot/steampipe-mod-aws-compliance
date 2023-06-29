locals {
  conformance_pack_glacier_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Glacier"
  })
}

control "glacier_vault_restrict_public_access" {
  title       = "Glacier vault should restrict public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS Glacier vault cannot be publicly accessed."
  query       = query.glacier_vault_restrict_public_access

  tags = merge(local.conformance_pack_glacier_common_tags, {
    other_checks = "true"
  })
}

query "glacier_vault_restrict_public_access" {
  sql = <<-EOQ
    with wildcard_action_policies as (
      select
        vault_arn,
        count(*) as statements_num
      from
        aws_glacier_vault,
        jsonb_array_elements(policy_std -> 'Statement') as s
      where
        s ->> 'Effect' = 'Allow'
        and (
          ( s -> 'Principal' -> 'AWS') = '["*"]'
          or s ->> 'Principal' = '*'
        )
      group by
        vault_arn
    )
    select
      g.vault_arn as resource,
      case
        when p.vault_arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when p.vault_arn is null then title || ' does not allow public access.'
        else title || ' contains ' || coalesce(p.statements_num, 0) ||
        ' statements that allow public access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "g.")}
    from
      aws_glacier_vault as g
      left join wildcard_action_policies as p on p.vault_arn = g.vault_arn;
  EOQ
}

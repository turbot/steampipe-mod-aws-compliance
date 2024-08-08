query "organizational_tag_policies_enabled" {
  sql = <<-EOQ
  tag_policy_enabled (
    select
      count(*) as count
    from
      aws_organizations_policy
    where
      type = 'TAG_POLICY'
  )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'Organizational tag policies are enabled.'
        else 'Organizational tag policies are not enabled.'
      end as reason
    from
      tag_policy_enabled;
  EOQ
}
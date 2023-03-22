# Non-Config rule query

query "account_alternate_contact_security_registered" {
  sql = <<-EOQ
    with alternate_security_contact as (
      select
        name,
        account_id
      from
        aws_account_alternate_contact
      where
        contact_type = 'SECURITY'
    )
    select
      arn as resource,
      case
        when a.partition = 'aws-us-gov' then 'info'
        -- Name is a required field if setting a security contact
        when c.name is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.partition = 'aws-us-gov' then a.title || ' in GovCloud, manual verification required.'
        when c.name is not null then a.title || ' has security contact ' || c.name || ' registered.'
        else a.title || ' security contact not registered.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join alternate_security_contact as c on c.account_id = a.account_id;
  EOQ
}

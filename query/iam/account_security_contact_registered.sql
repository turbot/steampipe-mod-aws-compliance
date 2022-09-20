with alternate_security_contact as (
  select
    name,
    account_id,
    contact_account_id
  from
    aws_account_alternate_account
  where
    alternate_contact_type = 'SECURITY'
)
select
  -- Required Columns
  arn as resource,
  case
    when c.name is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when c.name is not null then title || ' security contact information registered.'
    else title || ' security contact information not registered.'
  end as reason,
  -- Additional Dimensions
  a.account_id
from
  aws_account as a
  left join alternate_security_contact as c on c.account_id = a.account_id;
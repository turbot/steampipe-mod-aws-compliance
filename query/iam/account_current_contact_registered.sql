with contact_details as (
  select
    full_name,
    account_id,
    contact_account_id
  from
    aws_account_contact
)
select
  -- Required Columns
  arn as resource,
  case
    when c.full_name is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when c.full_name is not null then title || ' has currrent contact details.'
    else title || ' does not have currrent contact details.'
  end as reason,
  -- Additional Dimensions
  a.account_id
from
  aws_account as a
  left join contact_details as c on c.account_id = a.account_id;
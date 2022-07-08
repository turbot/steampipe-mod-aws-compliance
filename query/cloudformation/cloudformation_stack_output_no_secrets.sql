with stack_output as (
  select
    id,
    jsonb_array_elements(outputs) -> 'OutputKey' as k,
    jsonb_array_elements(outputs) -> 'OutputValue' as v,
    region,
    account_id
  from
    aws_cloudformation_stack
),stack_with_secrets as (
    select
      distinct id
    from
      stack_output
    where
      lower(k::text) like any (array ['%pass%', '%secret%','%token%','%key%'])
      or k::text ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' or lower(v::text) like any (array ['%pass%', '%secret%','%token%','%key%']) or v::text ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]'
)
select
  -- Required Columns
  c.id as resource,
  case
    when c.outputs is null then 'ok'
    when s.id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when c.outputs is null then title || ' has no outputs.'
    when s.id is null then title || ' no secrets found in outputs.'
    else title || ' has secrets in outputs.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudformation_stack as c
  left join stack_with_secrets as s on c.id = s.id;
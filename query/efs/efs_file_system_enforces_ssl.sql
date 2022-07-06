with ssl_ok as (
  select
    distinct name,
    arn,
    'ok' as status
  from
    aws_efs_file_system,
    jsonb_array_elements(policy_std -> 'Statement') as s,
    jsonb_array_elements_text(s -> 'Principal' -> 'AWS') as p,
    jsonb_array_elements_text(s -> 'Action') as a,
    jsonb_array_elements_text(
      s -> 'Condition' -> 'Bool' -> 'aws:securetransport'
    ) as ssl
  where
    p = '*'
    and s ->> 'Effect' = 'Deny'
    and ssl :: bool = false
)
select
  -- Required Columns
  f.arn as resource,
  case
    when ok.status = 'ok' then 'ok'
    else 'alarm'
  end status,
  case
    when ok.status = 'ok' then f.title || ' policy enforces HTTPS.'
    else f.title || ' policy does not enforce HTTPS.'
  end reason,
  -- Additional Dimensions
  f.region,
  f.account_id
from
  aws_efs_file_system as f
  left join ssl_ok as ok on ok.name = f.name;
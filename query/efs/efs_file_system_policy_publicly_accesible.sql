with wildcard_action_policies as (
  select
    arn,
    count(*) as statements_num
  from
    aws_efs_file_system,
    jsonb_array_elements(policy_std -> 'Statement') as s
  where
    s ->> 'Effect' = 'Allow'
    and (
      ( s -> 'Principal' -> 'AWS') = '["*"]'
      or s ->> 'Principal' = '*'
    )
  group by
    arn
)
select
  r.arn as resource,
  case
    when r.policy is not null and p.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when r.policy is not null and p.arn is null then title || ' policy does not allow public access.'
    when  r.policy is null then title || ' policy does not exist.'
    else title || ' policy contains ' || coalesce(p.statements_num, 0) || ' statement(s) that allow public access.'
  end as reason,
  r.region, r.account_id
from
  aws_efs_file_system as r
  left join wildcard_action_policies as p on p.arn = r.arn

with wildcard_action_policies as (
  select
    arn,
    count(*) as statements_num
  from
    aws_lambda_function,
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
  -- Required Columns
  f.arn as resource,
  case
    when p.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when p.arn is null then title || ' does not allow public access.'
    else title || ' contains ' || coalesce(p.statements_num,0) ||
    ' statements that allows public access.'
  end as reason,
  -- Additional Dimensions
  f.region,
  f.account_id
from
  aws_lambda_function as f
  left join wildcard_action_policies as p on p.arn = f.arn;
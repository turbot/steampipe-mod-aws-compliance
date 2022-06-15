with wildcard_action_policies as (
  select
    arn,
    count(*) as statements_num
  from
    aws_kms_key,
    jsonb_array_elements(policy_std -> 'Statement') as s
  where
    s ->> 'Effect' = 'Allow'
    and (
      ( s -> 'Principal' -> 'AWS') = '["*"]'
      or  s ->> 'Principal' = '*'
    )
    and key_manager = 'CUSTOMER'
  group by
    arn
)
select
  -- Required Columns
  k.arn as resource,
  case
    when p.arn is null then 'ok'
    else 'alarm'
  end status,
  case
    when p.arn is null then title || ' does not allow public access.'
    else title || ' contains ' || coalesce(p.statements_num,0) ||
    ' statements that allows public access.'
  end as reason,
  -- Additional Dimensions
  k.region,
  k.account_id
from
  aws_kms_key as k
  left join wildcard_action_policies as p on p.arn = k.arn
where
  key_manager = 'CUSTOMER';
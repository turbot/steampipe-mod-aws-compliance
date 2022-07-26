with domain_policies as (
  select
    arn,
    count(*) as statements_num
  from
    aws_codeartifact_domain,
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
  d.arn as resource,
  case
    when p.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when p.arn is null then title || ' does not allow public access.'
    else title || ' contains ' || coalesce(p.statements_num,0) || ' statements that allows public access.'
  end as reason,
  -- Additional Dimensions
  d.region,
  d.account_id
from
  aws_codeartifact_domain as d
  left join domain_policies as p on d.arn = p.arn;
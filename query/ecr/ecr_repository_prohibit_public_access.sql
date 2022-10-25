with open_access_ecr_repo as(
  select
    distinct arn
  from
    aws_ecr_repository,
    jsonb_array_elements(policy_std -> 'Statement') as s,
    jsonb_array_elements_text(s -> 'Principal' -> 'AWS') as p,
    string_to_array(p, ':') as pa,
    jsonb_array_elements_text(s -> 'Action') as a
  where
    s ->> 'Effect' = 'Allow'
    and (
      p = '*'
    )
)
select
  -- Required Columns
  r.arn as resource,
  case
    when o.arn is not null then 'alarm'
    else 'ok'
  end as status,
  case
    when o.arn is not null then r.title || ' allows public access.'
    else r.title || ' does not allow public access.'
  end as reason,
  -- Additional Dimensions
  r.region,
  r.account_id
from
  aws_ecr_repository as r
  left join open_access_ecr_repo as o on r.arn = o.arn
group by
  resource, status, reason, r.region, r.account_id;
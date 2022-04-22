-- This query checks the customer managed policies having * access and attached to IAM resource(s)
with star_access_policies as (
  select
    arn,
    count(*) as num_bad_statements
  from
    aws_iam_policy,
    jsonb_array_elements(policy_std -> 'Statement') as s,
    jsonb_array_elements_text(s -> 'Resource') as resource,
    jsonb_array_elements_text(s -> 'Action') as action
  where
    not is_aws_managed
    and s ->> 'Effect' = 'Allow'
    and resource = '*'
    and (
      (action = '*'
      or action = '*:*'
      )
    )
    and is_attached
  group by arn
 )
select
  -- Required Columns
  p.arn as resource,
  case
    when s.arn is null then 'ok'
    else 'alarm'
  end status,
  p.name || ' contains ' || coalesce(s.num_bad_statements,0)  ||
     ' statements that allow action "*" on resource "*".' as reason,
  -- Additional Dimensions
  p.account_id
from
  aws_iam_policy as p
  left join star_access_policies as s on p.arn = s.arn
where
  not p.is_aws_managed;

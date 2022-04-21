with wildcard_action_policies as (
  select
    arn,
    count(*) as statements_num
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
      action like '%:*'
      or action = '*'
    )
  group by
    arn
)
select
  -- Required Columns
  p.arn as resource,
  case
    when w.arn is null then 'ok'
    else 'alarm'
  end status,
  p.name || ' contains ' || coalesce(w.statements_num,0)  ||
     ' statements that allow action "*" on at least 1 AWS service on resource "*".' as reason,
  -- Additional Dimensions
  p.account_id
from
  aws_iam_policy as p
  left join wildcard_action_policies as w on p.arn = w.arn
where
  not p.is_aws_managed;

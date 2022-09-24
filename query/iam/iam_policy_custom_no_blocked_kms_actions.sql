with kms_blocked_actions as (
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
    and action like any(array['kms:decrypt', 'kms:reencryptfrom'])
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
    ' statements that allow blocked actions on AWS KMS keys.' as reason,
  -- Additional Dimensions
  p.account_id
from
  aws_iam_policy as p
  left join kms_blocked_actions as w on p.arn = w.arn
where
  not p.is_aws_managed;

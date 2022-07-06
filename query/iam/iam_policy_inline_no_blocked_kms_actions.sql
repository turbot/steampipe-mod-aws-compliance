with iam_resource_types as (
  select
    arn,
    inline_policies_std,
    name,
    account_id,
    region
  from
    aws_iam_user
  union
  select
    arn,
    inline_policies_std,
    name,
    account_id,
    region
  from
    aws_iam_role
  union
  select
    arn,
    inline_policies_std,
    name,
    account_id,
    region
  from
    aws_iam_group
),
kms_blocked_actions as (
  select
    arn,
    count(*) as statements_num
  from
    iam_resource_types,
    jsonb_array_elements(inline_policies_std) as policy_std,
    jsonb_array_elements(policy_std -> 'PolicyDocument' -> 'Statement') as s,
    jsonb_array_elements_text(s -> 'Resource') as resource,
    jsonb_array_elements_text(s -> 'Action') as action
  where
    s ->> 'Effect' = 'Allow'
    and action like any (ARRAY['kms:decrypt','kms:decrypt*', 'kms:reencryptfrom', 'kms:*', 'kms:reencrypt*'])
  group by
    arn
)
select
  -- Required Columns
  u.arn as resource,
  case
    when w.arn is null then 'ok'
    else 'alarm'
  end status,
  u.name || ' contains ' || coalesce(w.statements_num,0)  ||
    ' inline policy statement(s) that allow blocked actions on AWS KMS keys.' as reason,
  -- Additional Dimensions
  u.account_id
from
  iam_resource_types as u
  left join kms_blocked_actions as w on u.arn = w.arn;

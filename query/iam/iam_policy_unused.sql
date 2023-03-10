with in_use_policies as (
  select
    attached_policy_arns
  from
    aws_iam_user
  union
  select
    attached_policy_arns
  from
    aws_iam_group
  where
    jsonb_array_length(users) > 0
  union
  select
    attached_policy_arns
  from
    aws_iam_role
)
select
  -- Required Columns
  arn as resource,
  case
    when arn in (select jsonb_array_elements_text(attached_policy_arns) from in_use_policies) then 'ok'
    else 'alarm'
  end as status,
  case
    when arn in (select jsonb_array_elements_text(attached_policy_arns) from in_use_policies) then title || ' in use.'
    else title || ' not in use.'
  end as reason,
   -- Additional Dimensions
  account_id
from
  aws_iam_policy;
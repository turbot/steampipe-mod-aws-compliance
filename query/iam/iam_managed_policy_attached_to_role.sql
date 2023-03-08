with role_attached_policies as (
  select
    jsonb_array_elements_text(attached_policy_arns) as policy_arn
  from
    aws_iam_role
)
select
  -- Required Columns
  p.arn as resource,
  case
    when p.arn in (select policy_arn from role_attached_policies) then 'ok'
    else 'alarm'
  end as status,
  case
    when p.arn in (select policy_arn from role_attached_policies) then title || ' attached to IAM role.'
    else title || ' not attached to IAM role.'
  end as reason,
  -- Additional Dimensions
  p.account_id
from
  aws_iam_policy as p
where
  is_aws_managed;
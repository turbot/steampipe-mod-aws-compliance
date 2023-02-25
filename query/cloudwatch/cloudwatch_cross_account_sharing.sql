with iam_role_cross_account_sharing_count as (
  select 
    arn, 
    replace(replace(replace((a -> 'Principal' ->> 'AWS'), '[',''), ']', ''), '"', '') as cross_account_details,
    account_id  
  from
    aws_iam_role,
    jsonb_array_elements(assume_role_policy_std -> 'Statement') as a
  where
    name = 'CloudWatch-CrossAccountSharingRole'
)
select 
  a.arn as resource,
  case
    when c.arn is null then 'ok'
    else 'info'
  end as status,
  case
    when c.arn is null then 'CloudWatch does not allow cross-account sharing.' 
    else 'CloudWatch allow cross-account sharing with '|| cross_account_details || '.'
  end as reason,
  a.account_id
from
  aws_account as a
  left join iam_role_cross_account_sharing_count as c on c.account_id = a.account_id
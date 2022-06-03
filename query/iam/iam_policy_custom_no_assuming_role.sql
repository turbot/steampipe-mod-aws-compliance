with filter_users as (
  select
    user_id,
    name,
    policies
  from
    aws_iam_user,
    jsonb_array_elements_text(inline_policies) as policies
  where
	  policies like '%AssumeRole%'
)
select
-- Required Columns
	u.name as resource,
	case
		when policies like '%AssumeRole%'
      then 'alarm'
		else 'ok'
	end status,
  case
    when policies like '%AssumeRole%'
      then 'Custom policies for ' || u.name || ' permit assuming any role'
    else 'No custom policies for ' || u.name || ' permit assuming any role'
  end reason,
  -- Additional Dimensions
  u.region,
  u.account_id
from
	aws_iam_user u left join filter_users fu on u.user_id = fu.user_id
order by u.name;
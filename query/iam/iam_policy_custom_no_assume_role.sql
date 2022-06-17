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
	u.arn as resource,
	case
		when fu.user_id is not null then 'alarm'
		else 'ok'
	end as status,
  case
    when fu.user_id is not null then u.name || ' custom policies allows STS Role assumption.'
    else u.name || ' custom policies does not allow STS Role assumption.'
  end as reason,
  -- Additional Dimensions
  u.region,
  u.account_id
from
	aws_iam_user as u
  left join filter_users as fu on u.user_id = fu.user_id
order by
  u.name;
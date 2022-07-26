with event_targets as(
  select 
    arn, 
    t->> 'Arn' as  target_arn,
    state
  from 
    aws_eventbridge_rule,
    jsonb_array_elements(targets) t
)
select
  -- Required Columns
  p.arn as resource,
  case
    when t.target_arn is not null and t.state = 'ENABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when t.target_arn is not null and t.state = 'ENABLED' then title || ' automated deployment enabled.'
    else title || ' automated deployment disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_codebuild_project p
  left join event_targets t on p.arn = t.target_arn;
with backup_pan_retention as (
  select
    backup_plan_id,
    (r -> 'Lifecycle' ->> 'DeleteAfterDays')::int as DeleteAfterDays
  from
    aws_backup_plan,
    jsonb_array_elements(backup_plan -> 'Rules') as r
)
select
  -- Required Columns
  a.arn as resource,
  case
    when r.backup_plan_id is null then 'alarm'
    when r.DeleteAfterDays >= 35 then 'ok'
    else 'alarm'
  end as status,
  case
    when r.backup_plan_id is null then a.title || ' retention period not set.'
    when r.DeleteAfterDays >= 35 then a.title || ' retention period set to ' || r.DeleteAfterDays || ' days.'
    else a.title || ' retention period not set to ' || r.DeleteAfterDays || ' days.'
  end as reason,
  -- Additional Dimensions
  a.region,
  a.account_id
from
  aws_backup_plan as a
  left join backup_pan_retention as r on a.backup_plan_id = r.backup_plan_id;
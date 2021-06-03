with scaling_target_count as (
  select
    t.table_arn as arn,
    count(target.resource_id) as count
  from
    aws_dynamodb_table as t
    left join aws_appautoscaling_target as target on target.resource_id = concat('table/', t.name) and service_namespace = 'dynamodb'
  group by t.table_arn
)
select
  -- Required Columns
  d.table_arn as resource,
  case
    when t.count = 0 then 'alarm'
    when t.count < 2 then 'alarm'
    else 'ok'
  end as status,
  case
    when t.count = 0 then d.title || ' auto scaling not configured.'
    when t.count < 2 then d.title || ' auto scaling not enabled for both read and write capacity.'
    else d.title || ' autoscaling enabled for both read and write capacity.'
  end as reason,
  -- Additional Dimensions
  d.region,
  d.account_id
from
  aws_dynamodb_table d
  left join scaling_target_count t on t.arn = d.table_arn;

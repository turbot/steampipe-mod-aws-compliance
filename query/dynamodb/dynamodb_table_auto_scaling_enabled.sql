with target_count as (
  select
    t.resource_id as resource_id,
    count(t.resource_id) as count
  from
    aws_appautoscaling_target as t where service_namespace = 'dynamodb'
    group by t.resource_id
)
select
  -- Required Columns
  d.arn as resource,
  case
    when t.resource_id is null then 'alarm'
    when t.count < 2 then 'alarm'
    else 'ok'
  end as status,
  case
    when t.resource_id is null then d.title || ' autoscaling not enabled.'
    when t.count < 2 then d.title || ' auto scaling not enabled for both read and write capacity.'
    else d.title || ' autoscaling enabled for both read and write capacity.'
  end as reason,
  -- Additional Dimensions
  d.region,
  d.account_id
from
  aws_dynamodb_table as d
  left join target_count as t on concat('table/', d.name) = t.resource_id;

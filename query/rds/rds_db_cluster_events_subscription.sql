select
  -- Required Columns
  arn as resource,
  case
    when source_type <> 'db-cluster' then 'skip'
    when source_type = 'db-cluster' and enabled and event_categories_list @> '["failure", "maintenance"]' then 'ok'
    else 'alarm'
  end as status,
  case
    when source_type <> 'db-cluster' then cust_subscription_id || ' is skipped for critical database cluster events.'
    when source_type = 'db-cluster' and enabled and event_categories_list @> '["failure", "maintenance"]' then cust_subscription_id || ' has event notifications enabled for critical cluster events.'
    else cust_subscription_id || ' has event notifications disabled for critical cluster events.'
  end as reason,
  -- Add Dimensions
  region,
  account_id
from
  osborn.aws_rds_db_event_subscription;
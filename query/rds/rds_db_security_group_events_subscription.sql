select
  -- Required Columns
  arn as resource,
  case
    when source_type <> 'db-security-group' then 'skip'
    when source_type = 'db-security-group' and enabled and event_categories_list @> '["failure", "configuration change"]' then 'ok'
    else 'alarm'
  end as status,
  case
    when source_type <> 'db-security-group' then cust_subscription_id || ' is skipped for critical database security group events.'
    when source_type = 'db-security-group' and enabled and event_categories_list @> '["failure", "configuration change"]' then cust_subscription_id || ' has event notifications enabled for critical database security group events.'
    else cust_subscription_id || ' has event notifications disabled for critical database security group events.'
  end as reason,
  -- Add Dimensions
  region,
  account_id
from
  aws_rds_db_event_subscription;
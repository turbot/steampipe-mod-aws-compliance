(
select
  -- Required Columns
  arn as resource,
  case
    when cluster_snapshot -> 'AttributeValues' = '["all"]' then 'alarm'
    else 'ok'
  end as status,
  case
    when cluster_snapshot -> 'AttributeValues' = '["all"]' then title || ' not private.'
    else title || ' is private.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_cluster_snapshot,
  jsonb_array_elements(db_cluster_snapshot_attributes) as cluster_snapshot
)
union
(
select
  -- Required Columns
  arn as resource,
  case
    when database_snapshot -> 'AttributeValues' = '["all"]' then 'alarm'
    else 'ok'
  end as status,
  case
    when database_snapshot -> 'AttributeValues' = '["all"]' then title || ' not private.'
    else title || ' is private.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_snapshot,
  jsonb_array_elements(db_snapshot_attributes) as database_snapshot
);
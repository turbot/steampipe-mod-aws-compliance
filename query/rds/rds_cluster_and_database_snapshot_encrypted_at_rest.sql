(
select
  -- Required Columns
  arn as resource,
  case
    when storage_encrypted then 'ok'
    else 'alarm'
  end as status,
  case
    when storage_encrypted then title || ' db cluster snapshot encrypted.'
    else title || ' db cluster snapshot unencrypted.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_cluster_snapshot
)
union
(
select
  -- Required Columns
  arn as resource,
  case
    when encrypted then 'ok'
    else 'alarm'
  end as status,
  case
    when encrypted then title || ' db instance snapshot encrypted.'
    else title || ' db instance snapshot unencrypted.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_snapshot
);
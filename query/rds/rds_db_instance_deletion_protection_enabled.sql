select
  -- Required Columns
  arn as resource,
  case
    when engine like any(array['aurora%', 'docdb', 'neptune']) then 'skip'
    when deletion_protection then 'ok'
    else 'alarm'
  end status,
  case
    when engine like any(array['aurora%', 'docdb', 'neptune']) then title || ' has engine ' || engine || ' cluster, deletion protection is set at cluster level.'
    when deletion_protection then title || ' deletion protection enabled.'
    else title || ' deletion protection not enabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_instance;

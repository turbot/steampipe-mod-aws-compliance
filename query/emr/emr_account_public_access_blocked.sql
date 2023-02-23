select
  -- Required Columns
  created_by_arn as resource,
  case
    when block_public_security_group_rules then 'ok'
    else 'alarm'
  end as status,
  case
    when block_public_security_group_rules then ' EMR account has block public access enabled.'
    else ' EMR account has block public access disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_emr_cluster_block_public_access;

select
  -- Required Columns
  arn as resource,
  case
    when version = '1.22' then 'ok'
    else 'alarm'
  end as status,
  case
    when version = '1.22' then title || ' runs on a latest kubernetes version.'
    else title || ' does not run on a latest kubernetes version.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_eks_cluster;
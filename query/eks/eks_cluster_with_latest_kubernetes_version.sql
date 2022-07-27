select
  -- Required Columns
  arn as resource,
  case
    -- eks:oldestVersionSupported (Current oldest supported version is 1.19)
    when (version)::decimal >= 1.19 then 'ok'
    else 'alarm'
  end as status,
  case
    when (version)::decimal >= 1.19 then title || ' runs on a supported kubernetes version.'
    else title || ' does not run on a supported kubernetes version.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_eks_cluster;
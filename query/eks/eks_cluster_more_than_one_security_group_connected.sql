select
  -- Required Columns
  arn as resource,
  case
    when jsonb_array_length(resources_vpc_config -> 'SecurityGroupIds') > 1 then 'alarm'
    else 'ok'
  end as status,
    title || ' has ' || jsonb_array_length(resources_vpc_config -> 'SecurityGroupIds') || ' security groups connected.' as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_eks_cluster;
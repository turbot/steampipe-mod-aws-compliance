select
  -- Required columns
  distinct arn,
  case
    when v.account_id <> v.owner_id then 'skip'
    when f.resource_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when v.account_id <> v.owner_id then vpc_id || ' is a shared VPC.'
    when f.resource_id is not null then vpc_id || ' flow logging enabled.'
    else vpc_id || ' flow logging disabled.'
  end as reason,
  -- Additional columns
  v.region,
  v.account_id
from
  aws_vpc as v left join aws_vpc_flow_log as f on v.vpc_id = f.resource_id;

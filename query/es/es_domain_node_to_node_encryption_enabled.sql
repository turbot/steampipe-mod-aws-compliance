select
  -- Required Columns
  arn as resource,
  case
    when region = any(array['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1']) then 'skip'
    when not enabled then 'alarm'
    else 'ok'
  end as status,
  case
    when region = any(array['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1']) then title || ' node-to-node encryption not supported in ' || region || '.'
    when not enabled then title || ' node-to-node encryption disabled.'
    else title || ' node-to-node encryption enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_elasticsearch_domain;

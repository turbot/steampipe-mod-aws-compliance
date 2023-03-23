select
  -- Required Columns
  arn as resource,
  case
    when jsonb_array_length(resources) > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when jsonb_array_length(resources) > 0 then title || ' assoicated with any AWS resource.'
    else title || ' not assoicated with AWS resource.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_wafregional_web_acl;
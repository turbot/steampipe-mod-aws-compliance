select
  -- Required Columns
  arn as resource,
  case
    when virtualization_type = 'paravirtual' then 'alarm'
    else 'ok'
  end as status,
  title || ' virtualization type is ' || virtualization_type || '.' as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_instance;

select
  -- Required Columns
  arn as resource,
  case
    when virtualization_type = 'paravirtual' then 'alarm'
    else 'ok'
  end as status,
  case
    when virtualization_type = 'paravirtual' then title || ' virtualization type is paravirtual.'
    else title || ' virtualization type is ' || virtualization_type || '.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_instance;

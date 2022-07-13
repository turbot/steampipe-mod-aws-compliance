select
  -- Required Columns
  launch_configuration_arn as resource,
  case
    when metadata_options_put_response_hop_limit > 1 then 'alarm'
    else 'ok'
  end as status,
  case
    when metadata_options_put_response_hop_limit > 1 then title || ' metadata response hop limit is greater than 1.'
    else title || ' metadata response hop limit is not greater than 1.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_launch_configuration;
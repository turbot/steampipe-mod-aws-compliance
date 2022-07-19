select
  -- Required Columns
  launch_configuration_arn as resource,
  case
    when metadata_options_put_response_hop_limit > 1 then 'alarm'
    else 'ok'
  end as status,
  title || ' has a metadata response hop limit of ' || metadata_options_put_response_hop_limit || '.' as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_launch_configuration;
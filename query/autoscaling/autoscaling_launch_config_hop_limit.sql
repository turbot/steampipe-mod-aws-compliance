select
  -- Required Columns
  launch_configuration_arn as resource,
  case
    when metadata_options_put_response_hop_limit is null then 'ok'
    when metadata_options_put_response_hop_limit > 1 then 'alarm'
    else 'ok'
  end as status,
  case
     --If you do not specify a value, the hop limit default is 1.
    when metadata_options_put_response_hop_limit is null then title || ' metadata response hop limit set to default.'
    else title || ' has a metadata response hop limit of ' || metadata_options_put_response_hop_limit || '.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_launch_configuration;
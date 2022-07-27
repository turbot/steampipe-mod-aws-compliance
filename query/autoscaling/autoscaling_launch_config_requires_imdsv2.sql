select
  -- Required Columns
  launch_configuration_arn as resource,
  case
    when metadata_options_http_tokens = 'required' then 'ok'
    else 'alarm'
  end as status,
  case
    when metadata_options_http_tokens = 'required' then title || ' configured to use Instance Metadata Service Version 2 (IMDSv2).'
    else title || ' not configured to use Instance Metadata Service Version 2 (IMDSv2).'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_launch_configuration;
select
  -- Required Columns
  transit_gateway_arn as resource,
  case
    when auto_accept_shared_attachments = 'enable' then 'alarm'
    else 'ok'
  end status,
  case
    when auto_accept_shared_attachments = 'enable' then title || ' automatic shared account attachment enabled.'
    else title || ' automatic shared account attachment disabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_transit_gateway;
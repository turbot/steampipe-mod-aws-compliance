select
  -- Required Columns
  application_name as resource,
  case
    when health_status then 'ok'
    else 'alarm'
  end status,
  case
    when health_status then application_name || ' enhanced health check enabled.'
    else application_name || ' enhanced health check disabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_elastic_beanstalk_environment

-- Need to review this afer updating the basic plan
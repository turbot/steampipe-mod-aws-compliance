select
  -- Required Columns
  arn as resource,
  case
    when volume_type = 'gp2' then 'ok'
    else 'info'
  end as status,
  title || ' use ' ||
  case
    when volume_type = 'gp2' then 'General Purpose SSD.'
    when volume_type like any(array['io1', 'io2']) then 'Provisioned IOPS SSD.'
    when volume_type = 'st1' then 'Throughput Optimized HDD.'
    when volume_type = 'sc1' then 'Cold HDD.'
    when volume_type = 'standard' then 'Magnetic volume.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ebs_volume;
select
  -- Required Columns
  'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
  case
    when r.region = any (
      ARRAY ['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1']
    ) then 'skip'
    -- Skip any regions that are disabled in the account.
    when r.opt_in_status = 'not-opted-in' then 'skip'
    when status = 'ENABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when r.region = any ( ARRAY ['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1'] ) then r.region || ' region not supported.'
    when r.opt_in_status = 'not-opted-in' then r.region || ' region is disabled.'
    when status is null then 'No GuardDuty detector found in ' || r.region || '.'
    when status = 'ENABLED' then r.region || ' detector ' || d.title || ' enabled.'
    else r.region || ' detector ' || d.title || ' disabled.'
  end as reason,
  -- Additional Dimensions
  r.region,
  r.account_id
from
  aws_region as r
  left join aws_guardduty_detector d on d.region = r.name;

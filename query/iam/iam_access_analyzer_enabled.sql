select
  -- Required Columns
  'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
  case
    -- Skip any regions that are disabled in the account.
    when r.opt_in_status = 'not-opted-in' then 'skip'
    when aa.arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when r.opt_in_status = 'not-opted-in' then r.region || ' region is disabled.'
    when aa.arn is not null then aa.name ||  ' enabled in ' || r.region || '.'
    else 'Access Analyzer not enabled in ' || r.region || '.'
  end as reason,
  -- Additional Dimensions
  r.region,
  r.account_id
from
  aws_region as r
  left join aws_accessanalyzer_analyzer as aa on r.account_id = aa.account_id and r.region = aa.region;

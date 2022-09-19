select
  -- Required Columns
  'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
  case
    when r.region = any (ARRAY ['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'ap-northeast-3']) then 'skip'
    -- Skip any regions that are disabled in the account.
    when r.opt_in_status = 'not-opted-in' then 'skip'
    when h.hub_arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when r.region = any (ARRAY ['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'ap-northeast-3']) then r.region ||  ' region not supported.'
    when r.opt_in_status = 'not-opted-in' then r.region || ' region is disabled.'
    when h.hub_arn is not null then 'Security Hub enabled in ' || r.region || '.'
    else 'Security Hub disabled in ' || r.region || '.'
  end as reason,
  -- Additional Dimensions
  r.region,
  r.account_id
from
  aws_region as r
  left join aws_securityhub_hub as h on r.account_id = h.account_id and r.name = h.region;

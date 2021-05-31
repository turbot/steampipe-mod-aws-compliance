select
  -- Required Columns
  arn as resource,
  case
    when engine not ilike '%aurora-mysql%' then 'skip'
    when backtrack_window is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when engine not ilike '%aurora-mysql%' then title || ' not Aurora MySQL-compatible edition.'
    when backtrack_window is not null then title || ' Aurora MySQL-compatible cluster configured with backtracking.'
    else title || ' Aurora MySQL-compatible cluster not configured with backtracking.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from aws_rds_db_cluster;
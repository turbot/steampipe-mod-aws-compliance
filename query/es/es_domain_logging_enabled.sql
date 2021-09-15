select
  -- Required Columns
  arn as resource,
  case
    when
      log_publishing_options -> 'INDEX_SLOW_LOGS' ->> 'Enabled' = 'true'
      and log_publishing_options -> 'SEARCH_SLOW_LOGS' ->> 'Enabled' = 'true'
      then 'ok'
    when
      log_publishing_options -> 'INDEX_SLOW_LOGS' ->> 'Enabled' = 'true'
      and log_publishing_options -> 'SEARCH_SLOW_LOGS' ->> 'Enabled' = 'false'
      then 'alarm'
    when
      log_publishing_options -> 'INDEX_SLOW_LOGS' ->> 'Enabled' = 'false'
      and log_publishing_options -> 'SEARCH_SLOW_LOGS' ->> 'Enabled' = 'true'
      then 'alarm'
    else 'alarm'
  end as status,
  case
    when
      log_publishing_options -> 'INDEX_SLOW_LOGS' ->> 'Enabled' = 'true'
      and log_publishing_options -> 'SEARCH_SLOW_LOGS' ->> 'Enabled' = 'true'
      then title || ' INDEX_SLOW_LOGS and SEARCH_SLOW_LOGS enabled.'
    when
      log_publishing_options -> 'INDEX_SLOW_LOGS' ->> 'Enabled' = 'true'
      and log_publishing_options -> 'SEARCH_SLOW_LOGS' ->> 'Enabled' = 'false'
      then title || ' SEARCH_SLOW_LOGS disabled.'
    when
      log_publishing_options -> 'INDEX_SLOW_LOGS' ->> 'Enabled' = 'false'
      and log_publishing_options -> 'SEARCH_SLOW_LOGS' ->> 'Enabled' = 'true'
      then title || ' INDEX_SLOW_LOGS disabled.'
    else title || ' logging disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_elasticsearch_domain;
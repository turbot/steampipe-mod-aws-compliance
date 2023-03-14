select
  -- Required Columns
  arn as resource,
  case
    when log_publishing_options is null then 'alarm'
    when
      ( log_publishing_options -> 'AUDIT_LOGS' is null
        or log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'false'
        or (log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'AUDIT_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
      )
      and
      ( log_publishing_options -> 'INDEX_SLOW_LOGS' is null
        or log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'false'
        or (log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
      )
      and
      ( log_publishing_options -> 'SEARCH_SLOW_LOGS' is null
        or log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'false'
        or (log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
      )
      and
      ( log_publishing_options -> 'ES_APPLICATION_LOGS' is null
        or log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'false'
        or (log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
      )
       then 'ok'
    else 'alarm'
  end as status,
  case
    when log_publishing_options is null then title || ' logging not enabled.'
    when
      ( log_publishing_options -> 'AUDIT_LOGS' is null
        or log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'false'
        or (log_publishing_options -> 'AUDIT_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'AUDIT_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
      )
      and
      ( log_publishing_options -> 'INDEX_SLOW_LOGS' is null
        or log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'false'
        or (log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'INDEX_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
      )
      and
      ( log_publishing_options -> 'SEARCH_SLOW_LOGS' is null
        or log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'false'
        or (log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'SEARCH_SLOW_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
      )
      and
      ( log_publishing_options -> 'ES_APPLICATION_LOGS' is null
        or log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'false'
        or (log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'Enabled' = 'true' and log_publishing_options -> 'ES_APPLICATION_LOGS' -> 'CloudWatchLogsLogGroupArn' is not null)
      ) then title || ' send logs to Amazon CloudWatch.'
    else title || ' does not send logs to Amazon CloudWatch.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_opensearch_domain;
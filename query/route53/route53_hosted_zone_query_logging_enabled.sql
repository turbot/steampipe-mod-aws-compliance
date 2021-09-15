with query_logging as (
  select
    distinct id
  from
    aws_route53_zone,
    jsonb_array_elements(query_logging_configs) as q
  where
    q -> 'CloudWatchLogsLogGroupArn' is not null
)
select
  -- Required Columns
  a.id as resource,
  case
    when b.id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.id is not null then a.title || ' query logging enabled.'
    else a.title || ' query logging disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_route53_zone as a
  left join query_logging as b on a.id = b.id;

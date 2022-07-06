with wildcard_action_policies as (
  select
    queue_arn,
    count(*) as statements_num
  from
    aws_sqs_queue,
    jsonb_array_elements(policy_std -> 'Statement') as s
  where
    s ->> 'Effect' = 'Allow'
    and (
      ( s -> 'Principal' -> 'AWS') = '["*"]'
      or s ->> 'Principal' = '*'
    )
  group by
    queue_arn
)
select
  -- Required Columns
  q.queue_arn as resource,
  case
    when p.queue_arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when p.queue_arn is null then title || ' does not allow public access.'
    else title || ' contains ' || coalesce(p.statements_num,0) ||
    ' statements that allows public access.'
  end as reason,
  -- Additional Dimensions
  q.region,
  q.account_id
from
  aws_sqs_queue as q
  left join wildcard_action_policies as p on q.queue_arn = p.queue_arn;
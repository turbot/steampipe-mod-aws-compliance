with public_queue_policies as (
  select
    queue_arn,
    count(*) as num_public_policy
  from
    aws_sqs_queue,
    jsonb_array_elements(policy_std -> 'Statement') as s
  where
    s ->> 'Effect' = 'Allow'
    and (
      s -> 'Principal' -> 'AWS' @> '"*"'
      or  s -> 'Principal' -> 'CanonicalUser' @> '"*"'
      or  s ->> 'Principal'::text =  '*'
     )
  group by
    queue_arn
),
public_queue_with_condition as (
  select
    p.queue_arn,
    count(*) as num_public_policy
  from
    public_queue_policies as p
    left join aws_sqs_queue as s on s.queue_arn = p.queue_arn,
    jsonb_array_elements(policy_std -> 'Statement') as st
  where
   st -> 'Condition' is not null
  group by
    p.queue_arn
)
select
  -- Required Columns
  a.queue_arn as resource,
  case
    when b.queue_arn is not null and c.queue_arn is not null then 'ok'
    when b.queue_arn is not null and c.queue_arn is null then 'alarm'
    else 'ok'
  end status,
  case
    when b.queue_arn is not null and c.queue_arn is not null then title || ' publicly accessible but has a condition.'
    when b.queue_arn is not null and c.queue_arn is null then title || ' publicly accessible.'
    else title || ' not publicly accessible.'
  end reason,
  a.account_id,
  a.region
from
  aws_sqs_queue as a
  left join public_queue_policies as b on a.queue_arn = b.queue_arn
  left join public_queue_with_condition as c on c.queue_arn = b.queue_arn;

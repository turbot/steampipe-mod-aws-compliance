with public_topic_policies as (
  select
    topic_arn,
    count(*) as num_public_policy
  from
    aws_sns_topic,
    jsonb_array_elements(policy_std -> 'Statement') as s
  where
    s ->> 'Effect' = 'Allow'
    and (
      s -> 'Principal' -> 'AWS' @> '"*"'
      or  s -> 'Principal' -> 'CanonicalUser' @> '"*"'
      or  s ->> 'Principal'::text =  '*'
     )
  group by
    topic_arn
),
public_topic_with_condition as (
  select
    p.topic_arn,
    count(*) as num_public_policy
  from
    public_topic_policies as p
    left join aws_sns_topic as s on s.topic_arn = p.topic_arn,
    jsonb_array_elements(policy_std -> 'Statement') as st
  where
   st -> 'Condition' is not null
  group by
    p.topic_arn
)
select
  -- Required Columns
  a.topic_arn as resource,
  case
    when b.topic_arn is not null and c.topic_arn is not null then 'ok'
    when b.topic_arn is not null and c.topic_arn is null then 'alarm'
    else 'ok'
  end status,
  case
    when b.topic_arn is not null and c.topic_arn is not null then title || ' publicly accessible but has a condition.'
    when b.topic_arn is not null and c.topic_arn is null then title || ' publicly accessible.'
    else title || ' not publicly accessible.'
  end reason,
  a.account_id
from
  aws_sns_topic as a
  left join public_topic_policies as b on a.topic_arn = b.topic_arn
  left join public_topic_with_condition as c on c.topic_arn = b.topic_arn;

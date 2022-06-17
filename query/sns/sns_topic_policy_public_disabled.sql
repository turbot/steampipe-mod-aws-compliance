with wildcard_action_policies as (
  select
    topic_arn,
    count(*) as statements_num
  from
    aws_sns_topic,
    jsonb_array_elements(policy_std -> 'Statement') as s
  where
    s ->> 'Effect' = 'Allow'
    and (
      ( s -> 'Principal' -> 'AWS') = '["*"]'
      or s ->> 'Principal' = '*'
    )
  group by
    topic_arn
)
select
  t.topic_arn as resource,
  case
    when p.topic_arn is null then 'ok'
    else 'alarm'
  end status,
  case
    when p.topic_arn is null then title || ' does not allow public access.'
    else title || ' contains ' || coalesce(p.statements_num,0) ||
    ' statements that allows public access.'
  end as reason,
  t.region,
  t.account_id
from
  aws_sns_topic as t
  left join wildcard_action_policies as p on p.topic_arn = t.topic_arn;
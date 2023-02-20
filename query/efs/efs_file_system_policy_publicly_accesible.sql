with wildcard_action_policies as (
  select
    arn,
    count(*) as statements_num
  from
    aws_efs_file_system,
    jsonb_array_elements(policy_std -> 'Statement') as s
  where
    s ->> 'Effect' = 'Allow'
    -- aws:SourceOwner
    and s -> 'Condition' -> 'StringEquals' -> 'aws:sourceowner' is null
    and s -> 'Condition' -> 'StringEqualsIgnoreCase' -> 'aws:sourceowner' is null
    and (
      s -> 'Condition' -> 'StringLike' -> 'aws:sourceowner' is null
      or s -> 'Condition' -> 'StringLike' -> 'aws:sourceowner' ? '*'
    )
    -- aws:SourceAccount
    and s -> 'Condition' -> 'StringEquals' -> 'aws:sourceaccount' is null
    and s -> 'Condition' -> 'StringEqualsIgnoreCase' -> 'aws:sourceaccount' is null
    and (
      s -> 'Condition' -> 'StringLike' -> 'aws:sourceaccount' is null
      or s -> 'Condition' -> 'StringLike' -> 'aws:sourceaccount' ? '*'
    )
    -- aws:PrincipalOrgID
    and s -> 'Condition' -> 'StringEquals' -> 'aws:principalorgid' is null
    and s -> 'Condition' -> 'StringEqualsIgnoreCase' -> 'aws:principalorgid' is null
    and (
      s -> 'Condition' -> 'StringLike' -> 'aws:principalorgid' is null
      or s -> 'Condition' -> 'StringLike' -> 'aws:principalorgid' ? '*'
    )
    -- aws:PrincipalAccount
    and s -> 'Condition' -> 'StringEquals' -> 'aws:principalaccount' is null
    and s -> 'Condition' -> 'StringEqualsIgnoreCase' -> 'aws:principalaccount' is null
    and (
      s -> 'Condition' -> 'StringLike' -> 'aws:principalaccount' is null
      or s -> 'Condition' -> 'StringLike' -> 'aws:principalaccount' ? '*'
    )
    -- aws:PrincipalArn
    and s -> 'Condition' -> 'StringEquals' -> 'aws:principalarn' is null
    and s -> 'Condition' -> 'StringEqualsIgnoreCase' -> 'aws:principalarn' is null
    and (
      s -> 'Condition' -> 'StringLike' -> 'aws:principalarn' is null
      or s -> 'Condition' -> 'StringLike' -> 'aws:principalarn' ? '*'
    )
    and (
      s -> 'Condition' -> 'ArnEquals' -> 'aws:principalarn' is null
      or s -> 'Condition' -> 'ArnEquals' -> 'aws:principalarn' ? '*'
    )
    and (
      s -> 'Condition' -> 'ArnLike' -> 'aws:principalarn' is null
      or s -> 'Condition' -> 'ArnLike' -> 'aws:principalarn' ? '*'
    )
    -- aws:SourceArn
    and s -> 'Condition' -> 'StringEquals' -> 'aws:sourcearn' is null
    and s -> 'Condition' -> 'StringEqualsIgnoreCase' -> 'aws:sourcearn' is null
    and (
      s -> 'Condition' -> 'StringLike' -> 'aws:sourcearn' is null
      or s -> 'Condition' -> 'StringLike' -> 'aws:sourcearn' ? '*'
    )
    and (
      s -> 'Condition' -> 'ArnEquals' -> 'aws:sourcearn' is null
      or s -> 'Condition' -> 'ArnEquals' -> 'aws:sourcearn' ? '*'
    )
    and (
      s -> 'Condition' -> 'ArnLike' -> 'aws:sourcearn' is null
      or s -> 'Condition' -> 'ArnLike' -> 'aws:sourcearn' ? '*'
    )
    and (
      s -> 'Principal' -> 'AWS' = '["*"]'
      or s ->> 'Principal' = '*'
    )
  group by
    arn
)
select
  r.arn as resource,
  case
    when r.policy is not null and p.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when r.policy is not null and p.arn is null then title || ' policy does not allow public access.'
    when  r.policy is null then title || ' policy does not exist.'
    else title || ' policy contains ' || coalesce(p.statements_num, 0) || ' statement(s) that allow public access.'
  end as reason,
  r.region, r.account_id
from
  aws_efs_file_system as r
  left join wildcard_action_policies as p on p.arn = r.arn

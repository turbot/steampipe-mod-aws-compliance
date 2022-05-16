with all_inline_policy as (
  select
  arn,
    s
  from
    aws_iam_user,
    jsonb_array_elements(inline_policies) as p,
    jsonb_array_elements(p -> 'PolicyDocument' -> 'Statement') as s
      where
     s ->> 'Effect' = 'Allow'

)
  select
    arn,
    s,
case when  (jsonb_typeof(s -> 'Action') <> 'array' and  s ->> 'Action' not in         ('access-analyzer:ListAnalyzers','kms:Decrypt', 'kms:ReEncrypt*'))
or
  (s -> 'Action' @> '[("access-analyzer:ListAnalyzers","kms:Decrypt")]')  then 'alarm'
  else 'ok' end

  from
    all_inline_policy

  --where
    --  s ->> 'Effect' = 'Allow'
  --action like any (array ['kms:*','kms:Decrypt', 'kms:ReEncrypt*'])
  -- group by
  --   arn


select * from kms_action_inlinepilicy


select
    s,
    jsonb_typeof(s -> 'Action') as a

  from
    aws_iam_user,
    jsonb_array_elements(inline_policies) as p,
    jsonb_array_elements(p -> 'PolicyDocument' -> 'Statement') as s
    case jsonb_typeof(s -> 'Action')
    when 'array' then jsonb_array_elements_text(s -> 'Action'),
      else (s ->> 'Action')  end
    ) as action
   where
     -- s ->> 'Effect' = 'Allow'

    ( case when jsonb_typeof(s -> 'Action') <> 'array' then
    s ->> 'Action' = 'sts:AssumeRole' end)

  select
    s,
    jsonb_typeof(s -> 'Action') as a,
    string_to_array(s -> 'Action')

  from
    aws_iam_user,
    jsonb_array_elements(inline_policies) as p,
    jsonb_array_elements(p -> 'PolicyDocument' -> 'Statement') as s
   where
     jsonb_typeof(s -> 'Action') = 'string'

    ( case when jsonb_typeof(s -> 'Action') <> 'array' then
    s ->> 'Action' = 'sts:AssumeRole' end)
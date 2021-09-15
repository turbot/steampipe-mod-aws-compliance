with public_cmk as (
  select
    distinct arn
  from
    aws_new.aws_kms_key,
    jsonb_array_elements(policy_std -> 'Statement') as statement
  where
    statement -> 'Principal' -> 'AWS' @> '"*"'
    and key_manager = 'CUSTOMER'
)
select
  -- Required Columns
  a.arn as resource,
  case
    when b.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.arn  is null then a.title || ' not exposed to public.'
    else a.title || ' exposed to public.'
  end as reason,
  -- Additional Dimensions
  a.region,
  a.account_id
from
  aws_new.aws_kms_key as a
  left join public_cmk as b on b.arn = a.arn
where
  a.key_manager = 'CUSTOMER';
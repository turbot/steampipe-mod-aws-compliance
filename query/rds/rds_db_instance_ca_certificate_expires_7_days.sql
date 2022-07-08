select
  -- Required Columns
  arn as resource,
  case
    when extract(day from (to_timestamp(certificate ->> 'ValidTill','YYYY-MM-DDTHH:MI:SS')) - current_timestamp) <= '7' then 'alarm'
    else 'ok'
  end as status,
    title || ' expires ' || to_char(to_timestamp(certificate ->> 'ValidTill','YYYY-MM-DDTHH:MI:SS'), 'DD-Mon-YYYY') ||
    ' (' || extract(day from (to_timestamp(certificate ->> 'ValidTill','YYYY-MM-DDTHH:MI:SS')) - current_timestamp) || ' days).'
   as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_instance;

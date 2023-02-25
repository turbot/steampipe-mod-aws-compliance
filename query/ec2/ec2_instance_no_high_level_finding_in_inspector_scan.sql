with severity_list as (
  select
    distinct title ,
    a ->> 'Value' as instance_id
  from
    aws_inspector_finding,
    jsonb_array_elements(attributes) as a
  where
    severity = 'Medium'
    and asset_type = 'ec2-instance'
    and a ->> 'Key' = 'INSTANCE_ID'
  group by
    a ->> 'Value',
    title
), ec2_istance_list as (
  select
    distinct instance_id from severity_list
)
select
  -- Required Columns
  arn as resource,
  case
    when l.instance_id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when l.instance_id is null then i.title || ' has no high level finding in inspector scans.'
    else i.title || ' has ' || (select count(*) from severity_list where instance_id= i.instance_id) || ' high level findings in inspector scans.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_instance as i
  left join ec2_istance_list as l on i.instance_id = l.instance_id;
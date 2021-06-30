select
  -- Required Columns
  arn as resource,
  case
    when state = 'in-use' and attachment ->> 'DeleteOnTermination' = 'true' then 'ok'
    else 'alarm'
  end as status,
  case
    when state = 'in-use' and attachment ->> 'DeleteOnTermination' = 'true' then title || ' attached to ' || (attachment ->> 'InstanceId') || ', delete on termination enabled.'
    when state = 'in-use' and attachment ->> 'DeleteOnTermination' = 'false' then title || ' attached to ' || (attachment ->> 'InstanceId') || ', delete on termination disabled.'
    else title || ' not attached to ec2 instance.'
end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ebs_volume
  left join jsonb_array_elements(attachments) as attachment on true;
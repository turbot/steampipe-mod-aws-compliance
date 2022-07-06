select
  -- Required Columns
  arn as resource,
  case
    when user_data like any (array ['%pass%', '%secret%','%token%','%key%'])
      or user_data ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' then 'alarm'
    else 'ok'
  end as status,
  case
    when user_data like any (array ['%pass%', '%secret%','%token%','%key%'])
      or user_data ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' then instance_id ||' potential secret found in user data.'
    else instance_id ||  ' no secrets found in user data.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_instance;
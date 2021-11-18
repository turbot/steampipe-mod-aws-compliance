select
  -- Required Columns
  arn as resource,
  case
    when sse_description ->> 'Status' = 'ENABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when sse_description ->> 'Status' = 'ENABLED' then title || ' encryption at rest enabled.'
    else title || ' encryption at rest not enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_dax_cluster
-- DAX is not supported in all the regions, for more information please check the below link
-- https://aws.amazon.com/about-aws/whats-new/2018/04/amazon-dynamodb-accelerator-regional-expansion/
where
  region in('us-east-1','us-east-2','us-west-1','us-west-2','sa-east-1','eu-west-1','ap-southeast-1','ap-northeast-1','ap-southeast-2','ap-south-1');
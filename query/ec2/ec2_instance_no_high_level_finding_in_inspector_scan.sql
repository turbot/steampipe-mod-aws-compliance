select
  -- Required Columns
  arn as resource,
  case
    when finding_counts ->> 'High' = '0' then 'ok'
    else 'alarm'
  end as status,
  case
    when finding_counts ->> 'High' = '0' then 'No high level finding in inspector scans.'
    else (finding_counts ->> 'High') || ' high level findings in inspector scans.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_inspector_assessment_run;
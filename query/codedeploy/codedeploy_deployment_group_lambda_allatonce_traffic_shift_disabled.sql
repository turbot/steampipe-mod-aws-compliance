select
  -- Required Columns
  g.arn as resource,
  case
    when a.compute_platform <> 'Lambda' then 'skip'
    when deployment_config_name = 'CodeDeployDefault.LambdaAllAtOnce' then 'alarm'
    else 'ok'
  end as status,
  case
    when a.compute_platform <> 'Lambda' then g.title || ' using ' ||  a.compute_platform || ' compute platform.'
    else g.title || ' using '|| deployment_config_name || ' deployment config.'
  end as reason,
  -- Additional Dimensions
  g.region,
  g.account_id
from
  aws_codedeploy_deployment_group as g,
  aws_codedeploy_app as a
where
  g.application_name = a.application_name;

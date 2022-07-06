with control_panel_audit_logging as (
  select
    distinct arn,
    log -> 'Types' as log_type
  from
    aws_eks_cluster,
    jsonb_array_elements(logging -> 'ClusterLogging') as log
  where
    log ->> 'Enabled' = 'true'
    and (log -> 'Types') @> '["api", "audit", "authenticator", "controllerManager", "scheduler"]'
)
select
  -- Required Columns
  c.arn as resource,
  case
    when l.arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when l.arn is not null then c.title || ' control plane audit logging enabled for all log types.'
    else
      case when logging -> 'ClusterLogging' @> '[{"Enabled": true}]' then c.title || ' control plane audit logging not enabled for all log types.'
      else c.title || ' control plane audit logging not enabled.'
      end
  end as reason,
  -- Additional Dimensions
  c.region,
  c.account_id
from
  aws_eks_cluster as c
  left join control_panel_audit_logging as l on l.arn = c.arn;
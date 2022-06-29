select 
  -- Required Columns
  recovery_point_arn as resource,
  case
    when (lifecycle -> 'DeleteAfterDays') is null then 'ok'
    when (lifecycle -> 'DeleteAfterDays')::int >= 35 then 'ok'
    else 'alarm'
  end as status,
  case
    when (lifecycle -> 'DeleteAfterDays') is null then split_part(recovery_point_arn, ':', -1) || ' retention period set to never expire.'
    when (lifecycle -> 'DeleteAfterDays')::int >= 35 then split_part(recovery_point_arn, ':', -1) || ' recovery point expires after retention period.'
    else split_part(recovery_point_arn, ':', -1) || ' recovery point expires before retention period.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
 from aws_backup_recovery_point;
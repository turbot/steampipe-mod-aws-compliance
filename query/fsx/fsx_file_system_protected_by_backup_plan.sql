with mapped_with_id as (
  select
    jsonb_agg(elems) as mapped_ids
  from
    aws_backup_selection,
    jsonb_array_elements(resources) as elems
  group by backup_plan_id
),
mapped_with_tags as (
  select
    jsonb_agg(elems ->> 'ConditionKey') as mapped_tags
  from
    aws_backup_selection,
    jsonb_array_elements(list_of_tags) as elems
  group by backup_plan_id
),
backed_up_file_system as (
  select
    i.file_system_id
  from
    aws_fsx_file_system as i
    join mapped_with_id as t on t.mapped_ids ?| array[i.arn]
  union
  select
    i.file_system_id
  from
    aws_fsx_file_system as i
    join mapped_with_tags as t on t.mapped_tags ?| array(select jsonb_object_keys(tags))
)
select
  -- Required Columns
  i.file_system_id as resource,
  case
    when b.file_system_id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when b.file_system_id is null then i.title || ' not in backup plan.'
    else i.title || ' in backup plan.'
  end as reason,
  -- Additional Dimensions
  i.region,
  i.account_id
from
  aws_fsx_file_system as i
  left join backed_up_file_system as b on i.file_system_id = b.file_system_id;

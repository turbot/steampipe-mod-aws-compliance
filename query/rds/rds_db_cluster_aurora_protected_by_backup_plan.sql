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
backed_up_cluster as (
  select
    c.db_cluster_identifier
  from
    aws_rds_db_cluster as c
    join mapped_with_id as t on t.mapped_ids ?| array[c.arn]
  union
  select
    c.db_cluster_identifier
  from
    aws_rds_db_cluster as c
    join mapped_with_tags as t on t.mapped_tags ?| array(select jsonb_object_keys(tags))
)
select
  -- Required Columns
  c.arn as resource,
  case
    when c.engine not like '%aurora%' then 'skip'
    when b.db_cluster_identifier is null then 'alarm'
    else 'ok'
  end as status,
  case
    when c.engine not like '%aurora%' then c.title || ' not Aurora resources.'
    when b.db_cluster_identifier is null then c.title || ' not in backup plan.'
    else c.title || ' in backup plan.'
  end as reason,
  -- Additional Dimensions
  c.region,
  c.account_id
from
  aws_rds_db_cluster as c
  left join backed_up_cluster as b on c.db_cluster_identifier = b.db_cluster_identifier;
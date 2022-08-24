with autoscaling_groups as (
   select
      autoscaling_group_arn,
      title,
      mixed_instances_policy_launch_template_overrides,
      region,
      account_id 
   from
      aws_ec2_autoscaling_group 
),
distinct_instance_types_count as (
   select
      autoscaling_group_arn,
      count(distinct(e -> 'InstanceType')) as distinct_instance_types 
   from
      autoscaling_groups,
      jsonb_array_elements(mixed_instances_policy_launch_template_overrides) as e 
   group by
      autoscaling_group_arn,
      title,
      mixed_instances_policy_launch_template_overrides 
)
select
   -- Required Columns
   a.autoscaling_group_arn as resource,
   case
      when b.distinct_instance_types > 1 then 'ok' 
      else 'alarm' 
   end as status, 
   case
      when b.distinct_instance_types > 1 then title || ' uses ' || b.distinct_instance_types || ' instance types.' 
      else title || ' does not use multiple instance types.' 
   end as reason, 	
   -- Additional Dimensions
   region, 
   account_id 
from
   autoscaling_groups as a 
   left join distinct_instance_types_count as b on a.autoscaling_group_arn = b.autoscaling_group_arn;
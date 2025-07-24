Query Optimization:

## 1. query: ec2_instance_attached_ebs_volume_delete_on_termination_enabled

 #### Old: Time: 4.3s. Rows returned: 3. Rows fetched: 6. Hydrate calls: 6. Scans: 2.

 with ebs_volume_with_delete_on_termination_enabled as (
      select
        count(*) as count,
        arn
      from
        aws_ec2_instance,
        jsonb_array_elements(block_device_mappings) as p
      where
        p -> 'Ebs' ->> 'DeleteOnTermination' = 'false'
      group by
        arn
    )
    select
      i.arn as resource,
      case
        when e.count > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when e.count > 0 then ' EBS volume(s) attached to ' || title || ' has delete on termination disabled.'
        else ' EBS volume(s) attached to ' || title || ' has delete on termination enabled.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from
      aws_ec2_instance as i
      left join ebs_volume_with_delete_on_termination_enabled as e on e.arn = i.arn;

  #### New Time: 4.0s. Rows returned: 3. Rows fetched: 6 (3 cached). Hydrate calls: 3. Scans: 2.

  with ebs_volume_with_delete_on_termination_enabled as materialized (
    select
      count(*) as count,
      arn
    from aws_ec2_instance,
      jsonb_array_elements(block_device_mappings) as p
    where p -> 'Ebs' ->> 'DeleteOnTermination' = 'false'
    group by arn
  ),
  instances as materialized (
    select
      arn,
      title
    from aws_ec2_instance
  )
  select
    i.arn as resource,
    case
      when e.count > 0 then 'alarm'
      else 'ok'
    end as status,
    case
      when e.count > 0 then ' EBS volume(s) attached to ' || i.title || ' has delete on termination disabled.'
      else ' EBS volume(s) attached to ' || i.title || ' has delete on termination enabled.'
    end as reason
    -- ${local.tag_dimensions_sql}
    -- ${local.common_dimensions_sql}
  from instances i
  left join ebs_volume_with_delete_on_termination_enabled e using (arn);

## 2. query: ec2_ami_ebs_encryption_enabled

 #### Old: Time: 5.5s. Rows returned: 2. Rows fetched: 2. Hydrate calls: 2.

  with encryption_status as (
      select
        image_id as resource,
        region,
        account_id,
        tags,
        _ctx,
        bool_and(coalesce((mapping -> 'Ebs' ->> 'Encrypted')::text = 'true', false)) as all_encrypted
      from
        aws_ec2_ami
        cross join jsonb_array_elements(block_device_mappings) as mapping
      group by
        image_id,
        region,
        account_id,
        tags,
        _ctx
    )
    select
      resource,
      case
        when all_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when all_encrypted then resource || ' all EBS volumes are encrypted.'
        else resource || ' all EBS volumes are not encrypted.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from
      encryption_status;

  #### New Time: 5.3s. Rows returned: 2. Rows fetched: 2. Hydrate calls: 2.
  with encryption_status as materialized (
    select
      image_id as resource,
      region,
      account_id,
      tags,
      _ctx,
      bool_and(coalesce((mapping -> 'Ebs' ->> 'Encrypted')::text = 'true', false)) as all_encrypted
    from aws_ec2_ami
      cross join jsonb_array_elements(block_device_mappings) as mapping
    group by image_id, region, account_id, tags, _ctx
  )
  select
    resource,
    case
      when all_encrypted then 'ok'
      else 'alarm'
    end as status,
    case
      when all_encrypted then resource || ' all EBS volumes are encrypted.'
      else resource || ' all EBS volumes are not encrypted.'
    end as reason
    -- ${local.tag_dimensions_sql}
    -- ${local.common_dimensions_sql}
  from encryption_status;


## 3. query: ec2_instance_no_high_level_finding_in_inspector_scan

 #### Old: TTime: 9.1s. Rows returned: 3. Rows fetched: 3. Hydrate calls: 3. Scans: 2.

  with severity_list as (
      select
        distinct title,
        a ->> 'Value' as instance_id
      from
        aws_inspector_finding,
        jsonb_array_elements(attributes) as a
      where
        severity = 'High'
        and asset_type = 'ec2-instance'
        and a ->> 'Key' = 'INSTANCE_ID'
      group by
        a ->> 'Value',
        title
    ), ec2_istance_list as (
      select
        distinct instance_id
      from
        severity_list
    )
    select
      arn as resource,
      case
        when l.instance_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when l.instance_id is null then i.title || ' has no high level finding in inspector scans.'
        else i.title || ' has ' || (select count(*) from severity_list where instance_id = i.instance_id) || ' high level findings in inspector scans.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join ec2_istance_list as l on i.instance_id = l.instance_id;

  #### New Time: 5.3s. Rows returned: 2. Rows fetched: 2. Hydrate calls: 2.

    with instance_findings as materialized (
      select
        a.value ->> 'Value' as instance_id,
        count(*) as total_findings
      from aws_inspector_finding,
        lateral jsonb_array_elements(attributes) as a
      where severity = 'High'
        and asset_type = 'ec2-instance'
        and a.value ->> 'Key' = 'INSTANCE_ID'
      group by a.value ->> 'Value'
    )
    select
      i.arn as resource,
      case
        when if.instance_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when if.instance_id is null then i.title || ' has no high level finding in inspector scans.'
        else i.title || ' has ' || if.total_findings || ' high level findings in inspector scans.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance i left join instance_findings if on i.instance_id = if.instance_id;

locals {
  conformance_pack_dlm_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DLM"
  })
}

control "dlm_ebs_snapshot_lifecycle_policy_enabled" {
  title       = "DLM EBS snapshot lifecycle policy should be enabled"
  description = "Ensure DLM EBS snapshot lifecycle policy is enabled in all the regions with EBS snapshots."
  query       = query.dlm_ebs_snapshot_lifecycle_policy_enabled

  tags = merge(local.conformance_pack_dlm_common_tags, {
    nist_csf_v2 = "true"
  })
}

query "dlm_ebs_snapshot_lifecycle_policy_enabled" {
  sql = <<-EOQ
    with region_with_ebs_snapshots as(
      select
        distinct region,
        partition,
        account_id,
        _ctx
      from
        aws_ebs_snapshot
    ), dlm_ebs_lifecycle_policy as (
      select
        region,
        account_id,
        count(*)
      from
        aws_dlm_lifecycle_policy
      where
        policy_details ->> 'PolicyType' like 'EBS_SNAPSHOT%'
      group by
        region,
        account_id
    )
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when p.region is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when p.region is not null then 'EBS snapshot DLM policy exist in region ' || r.region || '.'
        else 'EBS snapshots DLM policy does not exist in region ' || r.region || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      region_with_ebs_snapshots as r
      left join dlm_ebs_lifecycle_policy as p on p.region = r.region and r.account_id = p.account_id;
  EOQ
}



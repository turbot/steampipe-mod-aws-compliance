locals {
  conformance_pack_drs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DRS"
  })
}

control "drs_job_exists" {
  title       = "Ensure DRS is enabled with jobs"
  description = "Check if DRS is enabled with jobs. This rule is non-compliant if DRS is not enabled with jobs for a particular region."
  query       = query.drs_job_exists

  tags = merge(local.conformance_pack_drs_common_tags, {
    other_checks = "true"
  })
}

query "drs_job_exists" {
  sql = <<-EOQ
    with drs_job_count as (
      select
        count(*) as count,
        region,
        account_id,
        _ctx
      from
        aws_drs_job
      group by
        region,
        account_id,
        _ctx
    )
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when drs_job_count.count = 0 or drs_job_count.count is null then 'alarm'
        else 'ok'
      end as status,
      case
        when drs_job_count.count = 0 or drs_job_count.count is null then 'DRS job does not exist for ' || r.region || '.'
        else 'DRS job exist for ' || r.region || '.'
      end as reason
    from
      aws_region as r
    left join drs_job_count
    on
      r.region = drs_job_count.region;
  EOQ
}
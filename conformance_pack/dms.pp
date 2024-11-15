locals {
  conformance_pack_dms_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DMS"
  })
}

control "dms_replication_instance_not_publicly_accessible" {
  title       = "DMS replication instances should not be publicly accessible"
  description = "Manage access to the AWS Cloud by ensuring DMS replication instances cannot be publicly accessed."
  query       = query.dms_replication_instance_not_publicly_accessible

  tags = merge(local.conformance_pack_dms_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "dms_certificate_not_expired" {
  title       = "Ensure that all the expired DMS certificates are removed"
  description = "This control ensures that all expired DMS certificates are removed from AWS account."
  query       = query.dms_certificate_not_expired

  tags = local.conformance_pack_dms_common_tags
}

control "dms_replication_instance_automatic_minor_version_upgrade_enabled" {
  title       = "DMS replication instances should have automatic minor version upgrade enabled"
  description = "This control checks if automatic minor version upgrade is enabled for an AWS DMS replication instance. The control fails if automatic minor version upgrade isn't enabled for a DMS replication instance."
  query       = query.dms_replication_instance_automatic_minor_version_upgrade_enabled

  tags = local.conformance_pack_dms_common_tags
}

control "dms_endpoint_ssl_configured" {
  title       = "DMS endpoints should use SSL"
  description = "This control checks whether an AWS DMS endpoint uses an SSL connection. The control fails if the endpoint doesn't use SSL."
  query       = query.dms_endpoint_ssl_configured

  tags = local.conformance_pack_dms_common_tags
}

control "dms_replication_task_target_database_logging_enabled" {
  title       = "DMS replication tasks for the target database should have logging enabled"
  description = "This control checks whether logging is enabled with the minimum severity level of LOGGER_SEVERITY_DEFAULT for DMS replication tasks TARGET_APPLY and TARGET_LOAD. The control fails if logging isn't enabled for these tasks or if the minimum severity level is less than LOGGER_SEVERITY_DEFAULT."
  query       = query.dms_replication_task_target_database_logging_enabled

  tags = merge(local.conformance_pack_dms_common_tags, {
    acsc_essential_eight = "true"
  })
}

control "dms_replication_task_source_database_logging_enabled" {
  title       = "DMS replication tasks for the source database should have logging enabled"
  description = "This control checks whether logging is enabled with the minimum severity level of LOGGER_SEVERITY_DEFAULT for DMS replication tasks SOURCE_CAPTURE and SOURCE_UNLOAD. The control fails if logging isn't enabled for these tasks or if the minimum severity level is less than LOGGER_SEVERITY_DEFAULT."
  query       = query.dms_replication_task_source_database_logging_enabled

  tags = merge(local.conformance_pack_dms_common_tags, {
    acsc_essential_eight = "true"
  })
}

query "dms_replication_instance_not_publicly_accessible" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when publicly_accessible then 'alarm'
        else 'ok'
      end as status,
      case
        when publicly_accessible then title || ' publicly accessible.'
        else title || ' not publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dms_replication_instance;
  EOQ
}

query "dms_certificate_not_expired" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when valid_to_date < (current_date - interval '1' second) then 'alarm'
        else 'ok'
      end as status,
      case
        when valid_to_date < (current_date - interval '1' second) then
        title || ' expired ' || to_char(valid_to_date, 'DD-Mon-YYYY') || '.'
        else
        title || ' valid until ' || to_char(valid_to_date, 'DD-Mon-YYYY')  || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_dms_certificate;
  EOQ
}

query "dms_replication_instance_automatic_minor_version_upgrade_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when auto_minor_version_upgrade then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_minor_version_upgrade then title || ' automatic minor version upgrade enabled.'
        else title || ' automatic minor version upgrade disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dms_replication_instance;
  EOQ
}

query "dms_endpoint_ssl_configured" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when ssl_mode = 'none' then 'alarm'
        else 'ok'
      end as status,
      case
        when ssl_mode = 'none' then title || ' SSL not configured.'
        else title || ' SSL configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dms_endpoint;
  EOQ
}

query "dms_replication_task_target_database_logging_enabled" {
  sql = <<-EOQ
    with replication_task_target_apply as (
      select
        arn
      from
        aws_dms_replication_task,
        jsonb_array_elements(replication_task_settings -> 'Logging' -> 'LogComponents') as o
      where
        o ->> 'Id' = 'TARGET_APPLY'
        and o ->> 'Severity' in ('LOGGER_SEVERITY_DEFAULT', 'LOGGER_SEVERITY_DEBUG', 'LOGGER_SEVERITY_DETAILED_DEBUG')
    ), replication_task_target_load as (
      select
        arn
      from
        aws_dms_replication_task,
        jsonb_array_elements(replication_task_settings -> 'Logging' -> 'LogComponents') as o
      where
        o ->> 'Id' = 'TARGET_LOAD'
        and o ->> 'Severity' in ('LOGGER_SEVERITY_DEFAULT', 'LOGGER_SEVERITY_DEBUG', 'LOGGER_SEVERITY_DETAILED_DEBUG')
    )
    select
      t.arn as resource,
      (replication_task_settings -> 'Logging' ->> 'EnableLogging')::bool,
      case
        when (replication_task_settings -> 'Logging' ->> 'EnableLogging')::bool
          and a.arn is not null
          and l.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when (replication_task_settings -> 'Logging' ->> 'EnableLogging')::bool
          and a.arn is not null
          and l.arn is not null then title || ' target database logging enabled.'
        else title || 'target database logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dms_replication_task as t
      left join replication_task_target_apply as a on a.arn = t.arn
      left join replication_task_target_load as l on l.arn = t.arn;
  EOQ
}

query "dms_replication_task_source_database_logging_enabled" {
  sql = <<-EOQ
      with replication_task_logging as (
        select
          arn,
          bool_or(o ->> 'Id' = 'SOURCE_CAPTURE' and o ->> 'Severity' in ('LOGGER_SEVERITY_DEFAULT', 'LOGGER_SEVERITY_DEBUG', 'LOGGER_SEVERITY_DETAILED_DEBUG')) as capture_logging_enabled,
          bool_or(o ->> 'Id' = 'SOURCE_UNLOAD' and o ->> 'Severity' in ('LOGGER_SEVERITY_DEFAULT', 'LOGGER_SEVERITY_DEBUG', 'LOGGER_SEVERITY_DETAILED_DEBUG')) as unload_logging_enabled
        from
          aws_dms_replication_task,
          jsonb_array_elements(replication_task_settings -> 'Logging' -> 'LogComponents') as o
        group by
          arn
      )
      select
        t.arn as resource,
        (replication_task_settings -> 'Logging' ->> 'EnableLogging')::bool as logging_enabled,
        case
          when (replication_task_settings -> 'Logging' ->> 'EnableLogging')::bool and l.capture_logging_enabled and l.unload_logging_enabled then 'ok'
          else 'alarm'
          end as status,
        case
          when (replication_task_settings -> 'Logging' ->> 'EnableLogging')::bool and l.capture_logging_enabled and l.unload_logging_enabled then title || ' source database logging enabled.'
          else title || ' source database logging disabled.'
          end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
      from
        aws_dms_replication_task as t
        left join replication_task_logging as l on l.arn = t.arn;
  EOQ
}
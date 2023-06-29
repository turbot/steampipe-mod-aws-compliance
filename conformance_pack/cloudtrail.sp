locals {
  conformance_pack_cloudtrail_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudTrail"
  })
}

control "cloudtrail_trail_integrated_with_logs" {
  title       = "CloudTrail trails should be integrated with CloudWatch logs"
  description = "Use Amazon CloudWatch to centrally collect and manage log event activity. Inclusion of AWS CloudTrail data provides details of API call activity within your AWS account."
  query       = query.cloudtrail_trail_integrated_with_logs

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "cloudtrail_s3_data_events_enabled" {
  title       = "All S3 buckets should log S3 data events in CloudTrail"
  description = "The collection of Simple Storage Service (Amazon S3) data events helps in detecting any anomalous activity. The details include AWS account information that accessed an Amazon S3 bucket, IP address, and time of event."
  query       = query.cloudtrail_s3_data_events_enabled

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "cloudtrail_trail_logs_encrypted_with_kms_cmk" {
  title       = "CloudTrail trail logs should be encrypted with KMS CMK"
  description = "To help protect sensitive data at rest, ensure encryption is enabled for your Amazon CloudWatch Log Groups."
  query       = query.cloudtrail_trail_logs_encrypted_with_kms_cmk

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "cloudtrail_multi_region_trail_enabled" {
  title       = "At least one multi-region AWS CloudTrail should be present in an account"
  description = "AWS CloudTrail records AWS Management Console actions and API calls. You can identify which users and accounts called AWS, the source IP address from where the calls were made, and when the calls occurred. CloudTrail will deliver log files from all AWS Regions to your S3 bucket if MULTI_REGION_CLOUD_TRAIL_ENABLED is enabled."
  query       = query.cloudtrail_multi_region_trail_enabled

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "cloudtrail_trail_validation_enabled" {
  title       = "CloudTrail trail log file validation should be enabled"
  description = "Utilize AWS CloudTrail log file validation to check the integrity of CloudTrail logs. Log file validation helps determine if a log file was modified or deleted or unchanged after CloudTrail delivered it. This feature is built using industry standard algorithms: SHA-256 for hashing and SHA-256 with RSA for digital signing. This makes it computationally infeasible to modify, delete or forge CloudTrail log files without detection."
  query       = query.cloudtrail_trail_validation_enabled

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "cloudtrail_trail_enabled" {
  title       = "At least one enabled trail should be present in a region"
  description = "AWS CloudTrail can help in non-repudiation by recording AWS Management Console actions and API calls. You can identify the users and AWS accounts that called an AWS service, the source IP address where the calls generated, and the timings of the calls. Details of captured data are seen within AWS CloudTrail Record Contents."
  query       = query.cloudtrail_trail_enabled

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "cloudtrail_security_trail_enabled" {
  title       = "At least one trail should be enabled with security best practices"
  description = "This rule helps ensure the use of AWS recommended security best practices for AWS CloudTrail, by checking for the enablement of multiple settings. These include the use of log encryption, log validation, and enabling AWS CloudTrail in multiple regions."
  query       = query.cloudtrail_security_trail_enabled

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    cis_controls_v8_ig1 = "true"
    gdpr                = "true"
    gxp_21_cfr_part_11  = "true"
    gxp_eu_annex_11     = "true"
    nist_800_171_rev_2  = "true"
    nist_800_53_rev_4   = "true"
    nist_csf            = "true"
    soc_2               = "true"
  })
}

control "cloudtrail_s3_logging_enabled" {
  title       = "Ensure S3 bucket access logging is enabled on the CloudTrail S3 bucket"
  description = "S3 Bucket Access Logging generates a log that contains access records for each request made to your S3 bucket. An access log record contains details about the request, such as the request type, the resources specified in the request worked, and the time and date the request was processed. It is recommended that bucket access logging be enabled on the CloudTrail S3 bucket."
  query       = query.cloudtrail_s3_logging_enabled

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "cloudtrail_bucket_not_public" {
  title       = "Ensure the S3 bucket CloudTrail logs to is not publicly accessible"
  description = "CloudTrail logs a record of every API call made in your account. These log files are stored in an S3 bucket. Security Hub recommends that the S3 bucket policy, or access control list (ACL), be applied to the S3 bucket that CloudTrail logs to prevent public access to the CloudTrail logs."
  query       = query.cloudtrail_bucket_not_public

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "cloudtrail_multi_region_read_write_enabled" {
  title       = "CloudTrail trails should be enabled in all regions"
  description = "AWS CloudTrail is a web service that records AWS API calls for your account and delivers log files to you. The recorded information includes the identity of the API caller, the time of the API call, the source IP address of the API caller, the request parameters, and the response elements returned by the AWS service. CloudTrail provides a history of AWS API calls for an account, including API calls made via the Management Console, SDKs, command line tools, and higher-level AWS services (such as CloudFormation)."
  query       = query.cloudtrail_multi_region_read_write_enabled

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "cloudtrail_trail_insight_selectors_and_logging_enabled" {
  title       = "CloudTrail trails should have insight selectors and logging enabled"
  description = "CloudTrail Insights provides a powerful way to search and analyze CloudTrail log data using pre-built queries and machine learning algorithms. This can help to identify potential security threats and suspicious activity in near real-time, such as unauthorized access attempts, policy changes, or resource modifications."
  query       = query.cloudtrail_trail_insight_selectors_and_logging_enabled

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    other_checks = "true"
  })
}

control "cloudtrail_trail_bucket_mfa_enabled" {
  title       = "CloudTrail trail S3 buckets MFA delete should be enabled"
  description = "Ensure that CloudTrail trail S3 buckets should have MFA delete enabled. MFA delete helps prevent accidental bucket deletions by requiring the user who initiates the delete action to prove physical possession of an MFA device with an MFA code and adding an extra layer of friction and security to the delete action."
  query       = query.cloudtrail_trail_bucket_mfa_enabled

  tags = merge(local.conformance_pack_cloudtrail_common_tags, {
    other_checks = "true"
  })
}

query "cloudtrail_trail_integrated_with_logs" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when log_group_arn != 'null' and ((latest_delivery_time) > current_date - 1) then 'ok'
        else 'alarm'
      end as status,
      case
        when log_group_arn != 'null' and ((latest_delivery_time) > current_date - 1) then title || ' integrated with CloudWatch logs.'
        else title || ' not integrated with CloudWatch logs.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudtrail_trail
    where
      region = home_region;
  EOQ
}

query "cloudtrail_s3_data_events_enabled" {
  sql = <<-EOQ
    with s3_selectors as (
    select
      name as trail_name,
      is_multi_region_trail,
      bucket_selector
    from
      aws_cloudtrail_trail,
      jsonb_array_elements(event_selectors) as event_selector,
      jsonb_array_elements(event_selector -> 'DataResources') as data_resource,
      jsonb_array_elements_text(data_resource -> 'Values') as bucket_selector
    where
      is_multi_region_trail
      and data_resource ->> 'Type' = 'AWS::S3::Object'
      and event_selector ->> 'ReadWriteType' = 'All'
  )
  select
    b.arn as resource,
    case
      when count(bucket_selector) > 0 then 'ok'
      else 'alarm'
    end as status,
    case
      when count(bucket_selector) > 0 then b.name || ' object-level data events logging enabled.'
      else b.name || ' object-level data events logging disabled.'
    end as reason
    ${local.tag_dimensions_sql}
    ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
  from
    aws_s3_bucket as b
    left join s3_selectors on bucket_selector like (b.arn || '%') or bucket_selector = 'arn:aws:s3'
  group by
    b.account_id, b.region, b.arn, b.name, b.tags, b._ctx;
  EOQ
}

query "cloudtrail_trail_logs_encrypted_with_kms_cmk" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when kms_key_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when kms_key_id is null then title || ' logs are not encrypted at rest.'
        else title || ' logs are encrypted at rest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudtrail_trail
    where
      region = home_region;
  EOQ
}

query "cloudtrail_multi_region_trail_enabled" {
  sql = <<-EOQ
    with multi_region_trails as (
      select
        account_id,
        count(account_id) as num_multregion_trails
      from
        aws_cloudtrail_trail
      where
        is_multi_region_trail and region = home_region
        and is_logging
      group by
        account_id,
        is_multi_region_trail
    ), organization_trails as (
      select
        is_organization_trail,
        is_logging,
        is_multi_region_trail,
        account_id
      from
        aws_cloudtrail_trail
      where
        is_organization_trail
    )
    select
      distinct a.arn as resource,
      case
        when coalesce(num_multregion_trails, 0) >= 1 then 'ok'
        when o.is_organization_trail and o.is_logging and o.is_multi_region_trail then 'ok'
        when o.is_organization_trail and o.is_multi_region_trail and o.is_logging is null then 'info'
        else 'alarm'
      end as status,
      case
        when coalesce(num_multregion_trails, 0) >= 1 then a.title || ' has ' || coalesce(num_multregion_trails, 0) || ' multi-region trail(s).'
        when o.is_organization_trail and o.is_logging and o.is_multi_region_trail then a.title || ' has multi-region trail(s).'
        when o.is_organization_trail and o.is_multi_region_trail and o.is_logging is null then a.title || ' has organization trail, check organization account for cloudtrail logging status.'
        else a.title || ' does not have multi-region trail(s).'
      end as reason

      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join multi_region_trails as b on a.account_id = b.account_id
      left join organization_trails as o on a.account_id = o.account_id;
  EOQ
}

query "cloudtrail_trail_validation_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when log_file_validation_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when log_file_validation_enabled then title || ' log file validation enabled.'
        else title || ' log file validation disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudtrail_trail
    where
      region = home_region;
  EOQ
}

query "cloudtrail_trail_enabled" {
  sql = <<-EOQ
    with trails_enabled as (
      select
        arn,
        is_logging
      from
        aws_cloudtrail_trail
      where
        home_region = region
    )
    select
      a.arn as resource,
      case
        when b.is_logging is null and a.is_logging then 'ok'
        when b.is_logging then 'ok'
        else 'alarm'
      end as status,
      case
        when b.is_logging is null and a.is_logging then a.title || ' enabled.'
        when b.is_logging then a.title || ' enabled.'
        else a.title || ' disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      aws_cloudtrail_trail as a
    left join trails_enabled b on a.arn = b.arn;
  EOQ
}

query "cloudtrail_security_trail_enabled" {
  sql = <<-EOQ
    with trails_enabled as (
      select
        distinct arn,
        is_logging,
        event_selectors,
        coalesce(
          jsonb_agg(g) filter ( where not (g = 'null') ),
          $$[]$$::jsonb
        ) as excludeManagementEventSources
      from
        aws_cloudtrail_trail
        left join jsonb_array_elements(event_selectors) as e on true
        left join jsonb_array_elements_text(e -> 'ExcludeManagementEventSources') as g on true
      where
        home_region = region
      group by arn, is_logging, event_selectors
    ),
    all_trails as (
      select
        a.arn as arn,
        tags,
        _ctx,
        case
          when a.is_logging is null then b.is_logging
          else a.is_logging
        end as is_logging,
        case
          when a.event_selectors is null then b.event_selectors
          else a.event_selectors
        end as event_selectors,
        b.excludeManagementEventSources,
        a.include_global_service_events,
        a.is_multi_region_trail,
        a.log_file_validation_enabled,
        a.kms_key_id,
        a.region,
        a.account_id,
        a.title
      from
        aws_cloudtrail_trail as a
        left join trails_enabled as b on a.arn = b.arn
    )
  select
    arn as resource,
    case
      when not is_logging then 'alarm'
      when not include_global_service_events then 'alarm'
      when not is_multi_region_trail then 'alarm'
      when not log_file_validation_enabled then 'alarm'
      when kms_key_id is null then 'alarm'
      when not (jsonb_array_length(event_selectors) = 1 and event_selectors @> '[{"ReadWriteType":"All"}]') then 'alarm'
      when not (event_selectors @> '[{"IncludeManagementEvents":true}]') then 'alarm'
      when jsonb_array_length(excludeManagementEventSources) > 0 then 'alarm'
      else 'ok'
    end as status,
    case
      when not is_logging then title || ' disabled.'
      when not include_global_service_events then title || ' not recording global service events.'
      when not is_multi_region_trail then title || ' not a muti-region trail.'
      when not log_file_validation_enabled then title || ' log file validation disabled.'
      when kms_key_id is null then title || ' not encrypted with a KMS key.'
      when not (jsonb_array_length(event_selectors) = 1 and event_selectors @> '[{"ReadWriteType":"All"}]') then title || ' not recording events for both reads and writes.'
      when not (event_selectors @> '[{"IncludeManagementEvents":true}]') then title || ' not recording management events.'
      when jsonb_array_length(excludeManagementEventSources) > 0 then title || ' excludes management events for ' || trim(excludeManagementEventSources::text, '[]') || '.'
      else title || ' meets all security best practices.'
    end as reason

    ${local.tag_dimensions_sql}
    ${local.common_dimensions_sql}
  from
    all_trails;
  EOQ
}

query "cloudtrail_s3_logging_enabled" {
  sql = <<-EOQ
    select
      t.arn as resource,
      case
        when b.logging is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.logging is not null then t.title || '''s logging bucket ' || t.s3_bucket_name || ' has access logging enabled.'
        else t.title || '''s logging bucket ' || t.s3_bucket_name || ' has access logging disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      aws_cloudtrail_trail t
      inner join aws_s3_bucket b on t.s3_bucket_name = b.name
    where
      t.region = t.home_region;
  EOQ
}

query "cloudtrail_bucket_not_public" {
  sql = <<-EOQ
    with public_bucket_data as (
    -- note the counts are not exactly CORRECT because of the jsonb_array_elements joins,
    -- but will be non-zero if any matches are found
    select
      t.s3_bucket_name as name,
      b.arn,
      t.region,
      t.account_id,
      t.tags,
      t._ctx,
      count(acl_grant) filter (where acl_grant -> 'Grantee' ->> 'URI' like '%acs.amazonaws.com/groups/global/AllUsers') as all_user_grants,
      count(acl_grant) filter (where acl_grant -> 'Grantee' ->> 'URI' like '%acs.amazonaws.com/groups/global/AuthenticatedUsers') as auth_user_grants,
      count(s) filter (where s ->> 'Effect' = 'Allow' and  p = '*' ) as anon_statements
    from
      aws_cloudtrail_trail as t
    left join aws_s3_bucket as b on t.s3_bucket_name = b.name
    left join jsonb_array_elements(acl -> 'Grants') as acl_grant on true
    left join jsonb_array_elements(policy_std -> 'Statement') as s  on true
    left join jsonb_array_elements_text(s -> 'Principal' -> 'AWS') as p  on true
    group by
      t.s3_bucket_name,
      b.arn,
      t.region,
      t.account_id,
      t.tags,
      t._ctx
    )
    select
      case
        when arn is null then 'arn:aws:s3::' || name
        else arn
      end as resource,
      case
        when arn is null then 'skip'
        when all_user_grants > 0 then 'alarm'
        when auth_user_grants > 0 then 'alarm'
        when anon_statements > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when arn is null then name || ' not found in account ' || account_id || '.'
        when all_user_grants > 0 then name || ' grants access to AllUsers in ACL.'
        when auth_user_grants > 0 then name || ' grants access to AuthenticatedUsers in ACL.'
        when anon_statements > 0 then name || ' grants access to AWS:*" in bucket policy.'
        else name || ' does not grant anonymous access in ACL or bucket policy.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      public_bucket_data;
  EOQ
}

query "cloudtrail_multi_region_read_write_enabled" {
  sql = <<-EOQ
    with event_selectors_trail_details as (
      select
        distinct account_id
      from
        aws_cloudtrail_trail,
        jsonb_array_elements(event_selectors) as e
      where
        (is_logging and is_multi_region_trail and e ->> 'ReadWriteType' = 'All')
    ),
    advanced_event_selectors_trail_details as (
      select
        distinct account_id
      from
        aws_cloudtrail_trail,
        jsonb_array_elements_text(advanced_event_selectors) as a
      where
      -- when readOnly = true, then it is readOnly, when readOnly = false then it is writeOnly, if advanced_event_selectors is not null then it is both ReadWriteType
        (is_logging and is_multi_region_trail and advanced_event_selectors is not null and (not a like '%readOnly%'))
    )
    select
      a.title as resource,
      case
        when d.account_id is null and ad.account_id is null then 'alarm'
        else 'ok'
      end as status,
        case
        when d.account_id is null and ad.account_id is null then 'cloudtrail disabled.'
        else 'cloudtrail enabled.'
      end as reason

      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join event_selectors_trail_details as d on d.account_id = a.account_id
      left join advanced_event_selectors_trail_details as ad on ad.account_id = a.account_id;
  EOQ
}

query "cloudtrail_trail_insight_selectors_and_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when not is_logging then 'alarm'
        when is_logging and has_insight_selectors then 'ok'
        else 'alarm'
      end as status,
      case
        when not is_logging then title || ' logging is disabled.'
        when is_logging and has_insight_selectors then title || ' has insight selectors and logging enabled.'
        else title || ' does not has insight selectors enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudtrail_trail
    where
      region = home_region;
  EOQ
}

query "cloudtrail_trail_bucket_mfa_enabled" {
  sql = <<-EOQ
    select
      t.arn as resource,
      case
        when t.s3_bucket_name is null then 'alarm'
        when b.versioning_mfa_delete then 'ok'
        else 'alarm'
      end as status,
      case
        when t.s3_bucket_name is null then t.title || ' logging disabled.'
        when b.versioning_mfa_delete then t.title || t.s3_bucket_name || ' MFA enabled.'
        else t.title || t.s3_bucket_name || ' MFA disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      aws_cloudtrail_trail t
      left join aws_s3_bucket b on t.s3_bucket_name = b.name
    where
      t.region = t.home_region;
  EOQ
}
# Non-Config rule query

query "cloudtrail_s3_object_read_events_audit_enabled" {
  sql = <<-EOQ
    with s3_selectors as
    (
      select
        name as trail_name,
        is_multi_region_trail,
        bucket_selector
      from
        aws_cloudtrail_trail,
        jsonb_array_elements(event_selectors) as event_selector,
        jsonb_array_elements(event_selector -> 'DataResources') as data_resource,
        jsonb_array_elements_text(data_resource -> 'Values') as bucket_selector
      where
        is_multi_region_trail
        and data_resource ->> 'Type' = 'AWS::S3::Object'
        and event_selector ->> 'ReadWriteType' in
        (
          'ReadOnly',
          'All'
        )
    )
    select
      b.arn as resource,
      case
        when count(bucket_selector) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(bucket_selector) > 0 then b.name || ' object-level read events logging enabled.'
        else b.name || ' object-level read events logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket as b
      left join
        s3_selectors
        on bucket_selector like (b.arn || '%')
        or bucket_selector = 'arn:aws:s3'
    group by
      b.account_id, b.region, b.arn, b.name, b.tags, b._ctx;
  EOQ
}

query "cloudtrail_s3_object_write_events_audit_enabled" {
  sql = <<-EOQ
    with s3_selectors as
    (
      select
        name as trail_name,
        is_multi_region_trail,
        bucket_selector
      from
        aws_cloudtrail_trail,
        jsonb_array_elements(event_selectors) as event_selector,
        jsonb_array_elements(event_selector -> 'DataResources') as data_resource,
        jsonb_array_elements_text(data_resource -> 'Values') as bucket_selector
      where
        is_multi_region_trail
        and data_resource ->> 'Type' = 'AWS::S3::Object'
        and event_selector ->> 'ReadWriteType' in
        (
          'WriteOnly',
          'All'
        )
    )
    select
      b.arn as resource,
      case
        when count(bucket_selector) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count(bucket_selector) > 0 then b.name || ' object-level write events logging enabled.'
        else b.name || ' object-level write events logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket as b
      left join
        s3_selectors
        on bucket_selector like (b.arn || '%')
        or bucket_selector = 'arn:aws:s3'
    group by
      b.account_id, b.region, b.arn, b.name, b.tags, b._ctx;
  EOQ
}
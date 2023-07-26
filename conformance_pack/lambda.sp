locals {
  conformance_pack_lambda_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Lambda"
  })
}

control "lambda_function_dead_letter_queue_configured" {
  title       = "Lambda functions should be configured with a dead-letter queue"
  description = "Enable this rule to help notify the appropriate personnel through Amazon Simple Queue Service (Amazon SQS) or Amazon Simple Notification Service (Amazon SNS) when a function has failed."
  query       = query.lambda_function_dead_letter_queue_configured

  tags = merge(local.conformance_pack_lambda_common_tags, {
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    soc_2                                  = "true"
  })
}

control "lambda_function_in_vpc" {
  title       = "Lambda functions should be in a VPC"
  description = "Deploy AWS Lambda functions within an Amazon Virtual Private Cloud (Amazon VPC) for a secure communication between a function and other services within the Amazon VPC."
  query       = query.lambda_function_in_vpc

  tags = merge(local.conformance_pack_lambda_common_tags, {
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "lambda_function_restrict_public_access" {
  title       = "Lambda functions should restrict public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS Lambda functions cannot be publicly accessed."
  query       = query.lambda_function_restrict_public_access

  tags = merge(local.conformance_pack_lambda_common_tags, {
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "lambda_function_concurrent_execution_limit_configured" {
  title       = "Lambda functions concurrent execution limit configured"
  description = "Checks whether the AWS Lambda function is configured with function-level concurrent execution limit. The control is non compliant if the Lambda function is not configured with function-level concurrent execution limit."
  query       = query.lambda_function_concurrent_execution_limit_configured

  tags = merge(local.conformance_pack_lambda_common_tags, {
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    soc_2                                  = "true"
  })
}

control "lambda_function_cloudtrail_logging_enabled" {
  title       = "Lambda functions CloudTrail logging should be enabled"
  description = "Lambda functions logging is essential because once lambdas are triggered, all of the underlying compute resources are automatically managed for you. This control is compliant if CloudTrail logging is enabled."
  query       = query.lambda_function_cloudtrail_logging_enabled

  tags = merge(local.conformance_pack_lambda_common_tags, {
    other_checks = "true"
  })
}

control "lambda_function_tracing_enabled" {
  title       = "Lambda functions tracing should be enabled"
  description = "AWS X-Ray can be used to visualize the components of application, identify performance bottlenecks, and troubleshoot requests that resulted in an error. Lambda functions send trace data to X-Ray, and X-Ray processes the data to generate a service map and searchable trace summaries."
  query       = query.lambda_function_tracing_enabled

  tags = merge(local.conformance_pack_lambda_common_tags, {
    other_checks = "true"
  })
}

control "lambda_function_multiple_az_configured" {
  title       = "Lambda functions should operate in more than one availability zone"
  description = "This control checks if Lambda has more than one availability zone associated. The rule fails if only one availability zone is associated with Lambda."
  query       = query.lambda_function_multiple_az_configured

  tags = merge(local.conformance_pack_lambda_common_tags, {
    nist_csf = "true"
  })
}

control "lambda_function_use_latest_runtime" {
  title       = "Lambda functions should use latest runtimes"
  description = "This control checks that the Lambda function settings for runtimes match the expected values set for the latest runtimes for each supported language. This control checks for the following runtimes: nodejs18.x, nodejs16.x, nodejs14.x, python3.10, python3.9, python3.8, python3.7, ruby3.2, ruby2.7, java17, java11, java8, java8.al2, go1.x, dotnet7, dotnet6"
  query       = query.lambda_function_use_latest_runtime

  tags = merge(local.conformance_pack_lambda_common_tags, {
    nist_csf = "true"
  })
}

control "lambda_function_restrict_public_url" {
  title       = "Lambda functions should restrict public URL"
  description = "This control verifies that the Lambda function does not have a publicly accessible URL. Exposing services publicly could potentially make sensitive data accessible to malicious actors."
  query       = query.lambda_function_restrict_public_url

  tags = merge(local.conformance_pack_lambda_common_tags, {
    other_checks = "true"
  })
}

control "lambda_function_variables_no_sensitive_data" {
  title       = "Lambda functions variable should not have any sensitive data"
  description = "Ensure functions environment variables is not having any sensitive data. Leveraging Secrets Manager enables secure provisioning of database credentials to Lambda functions while also ensuring the security of databases. This approach eliminates the need to hardcode secrets in code or pass them through environmental variables. Additionally, Secrets Manager facilitates the secure retrieval of credentials for establishing connections to databases and performing queries, enhancing overall security measures."
  query       = query.lambda_function_variables_no_sensitive_data

  tags = merge(local.conformance_pack_lambda_common_tags, {
    other_checks = "true"
  })
}

query "lambda_function_dead_letter_queue_configured" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when dead_letter_config_target_arn is null then 'alarm'
        else 'ok'
      end as status,
      case
        when dead_letter_config_target_arn is null then title || ' configured with dead-letter queue.'
        else title || ' not configured with dead-letter queue.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lambda_function;
  EOQ
}

query "lambda_function_in_vpc" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_id is null or vpc_id = '' then 'alarm'
        else 'ok'
      end status,
      case
        when vpc_id is null or vpc_id = '' then title || ' is not in VPC.'
        else title || ' is in VPC ' || vpc_id || '.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lambda_function;
  EOQ
}

query "lambda_function_restrict_public_access" {
  sql = <<-EOQ
    with wildcard_action_policies as (
      select
        arn,
        count(*) as statements_num
      from
        aws_lambda_function,
        jsonb_array_elements(policy_std -> 'Statement') as s
      where
        s ->> 'Effect' = 'Allow'
        and (
          ( s -> 'Principal' -> 'AWS') = '["*"]'
          or s ->> 'Principal' = '*'
        )
      group by
        arn
    )
    select
      f.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when p.arn is null then title || ' does not allow public access.'
        else title || ' contains ' || coalesce(p.statements_num,0) ||
        ' statements that allows public access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "f.")}
    from
      aws_lambda_function as f
      left join wildcard_action_policies as p on p.arn = f.arn;
  EOQ
}

query "lambda_function_concurrent_execution_limit_configured" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when reserved_concurrent_executions is null then 'alarm'
        else 'ok'
      end as status,
      case
        when reserved_concurrent_executions is null then title || ' function-level concurrent execution limit not configured.'
        else title || ' function-level concurrent execution limit configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lambda_function;
  EOQ
}

query "lambda_function_cloudtrail_logging_enabled" {
  sql = <<-EOQ
    with function_logging_cloudtrails as (
      select
        distinct replace(replace(v::text,'"',''),'/','') as lambda_arn,
        d ->> 'Type' as type
      from
        aws_cloudtrail_trail,
        jsonb_array_elements(event_selectors) e,
        jsonb_array_elements(e -> 'DataResources') as d,
        jsonb_array_elements(d -> 'Values') v
      where
        d ->> 'Type' = 'AWS::Lambda::Function'
        and replace(replace(v::text,'"',''),'/','') <> 'arn:aws:lambda'
    ), function_logging_region as (
        select
          region as cloudtrail_region,
          replace(replace(v::text,'"',''),'/','') as lambda_arn
        from
          aws_cloudtrail_trail,
          jsonb_array_elements(event_selectors) e,
          jsonb_array_elements(e -> 'DataResources') as d,
          jsonb_array_elements(d -> 'Values') v
        where
          d ->> 'Type' = 'AWS::Lambda::Function'
          and replace(replace(v::text,'"',''),'/','') = 'arn:aws:lambda'
        group by
          region,
          lambda_arn
    ),
    function_logging_region_advance_es as (
      select
        region as cloudtrail_region
      from
        aws_cloudtrail_trail,
        jsonb_array_elements(advanced_event_selectors) a,
        jsonb_array_elements(a -> 'FieldSelectors') as f,
        jsonb_array_elements_text(f -> 'Equals') e
      where
        e = 'AWS::Lambda::Function'
        and f ->> 'Field' != 'eventCategory'
      group by
        region
    )
    select
      distinct l.arn as resource,
      case
        when (l.arn = c.lambda_arn)
          or (r.lambda_arn = 'arn:aws:lambda' and r.cloudtrail_region = l.region )
          or a.cloudtrail_region = l.region then 'ok'
        else 'alarm'
      end as status,
      case
        when (l.arn = c.lambda_arn)
          or (r.lambda_arn = 'arn:aws:s3' and r.cloudtrail_region = l.region )
          or a.cloudtrail_region = l.region then l.name || ' logging enabled.'
        else l.name || ' logging not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "l.")}
    from
      aws_lambda_function as l
      left join function_logging_cloudtrails as c on l.arn = c.lambda_arn
      left join function_logging_region as r on r.cloudtrail_region = l.region
      left join function_logging_region_advance_es as a on a.cloudtrail_region = l.region;
  EOQ
}

query "lambda_function_tracing_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when tracing_config ->> 'Mode' = 'PassThrough' then 'alarm'
        else 'ok'
      end as status,
      case
        when tracing_config ->> 'Mode' = 'PassThrough' then title || ' has tracing disabled.'
        else title || ' has tracing enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lambda_function;
  EOQ
}

query "lambda_function_multiple_az_configured" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_id is null or vpc_id = '' then 'skip'
        else case
          when
          (
            select
              count(distinct availability_zone_id)
            from
              aws_vpc_subnet
            where
              subnet_id in (select jsonb_array_elements_text(vpc_subnet_ids) )
          ) >= 2
          then 'ok'
          else 'alarm'
        end
      end as status,
      case
        when vpc_id is null or vpc_id = '' then title || ' is not in VPC.'
        else title || ' has ' || jsonb_array_length(vpc_subnet_ids) || ' availability zone(s).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lambda_function;
  EOQ
}

query "lambda_function_use_latest_runtime" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when package_type <> 'Zip' then 'skip'
        when runtime in ('nodejs18.x', 'nodejs16.x', 'nodejs14.x', 'python3.10', 'python3.9', 'python3.8', 'python3.7', 'ruby3.2', 'ruby2.7', 'java17', 'java11', 'java8', 'java8.al2', 'go1.x', 'dotnet7', 'dotnet6') then 'ok'
        else 'alarm'
      end as status,
      case
        when package_type <> 'Zip' then title || ' package type is ' || package_type || '.'
        when runtime in ('nodejs18.x', 'nodejs16.x', 'nodejs14.x', 'python3.10', 'python3.9', 'python3.8', 'python3.7', 'ruby3.2', 'ruby2.7', 'java17', 'java11', 'java8', 'java8.al2', 'go1.x', 'dotnet7', 'dotnet6') then title || ' uses latest runtime - ' || runtime || '.'
        else title || ' uses ' || runtime || ' which is not the latest version.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lambda_function;
  EOQ
}

query "lambda_function_restrict_public_url" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when url_config is null then 'info'
        when url_config ->> 'AuthType' = 'AWS_IAM' then 'ok'
        else 'alarm'
      end as status,
      case
        when url_config is null then title || ' having no URL config.'
        when url_config ->> 'AuthType' = 'AWS_IAM' then title || ' restricts public function URL.'
        else title || ' public function URL configured.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lambda_function;
  EOQ
}

query "lambda_function_variables_no_sensitive_data" {
  sql = <<-EOQ
    with function_vaiable_with_sensitive_data as (
    select
      distinct arn,
      name
    from
      aws_lambda_function
      join jsonb_each_text(environment_variables) d on true
    where
      d.key ilike any (array['%pass%', '%secret%', '%token%', '%key%'])
      or d.key ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]'
      or d.value ilike any (array['%pass%', '%secret%', '%token%', '%key%'])
      or d.value ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]'
    )
    select
      f.arn as resource,
      case
        when b.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is null then f.title || ' has no sensitive data.'
        else f.title || ' has potential sensitive data.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lambda_function as f
      left join function_vaiable_with_sensitive_data b on f.arn = b.arn;
  EOQ
}

# Non-Config rule query

query "lambda_function_cors_configuration" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when url_config is null then 'info'
        when url_config -> 'Cors' ->> 'AllowOrigins' = '["*"]' then 'alarm'
        else 'ok'
      end as status,
      case
        when url_config is null then title || ' does not has a URL config.'
        when url_config -> 'Cors' ->> 'AllowOrigins' = '["*"]' then title || ' CORS configuration allows all origins.'
        else title || ' CORS configuration does not allow all origins.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lambda_function;
  EOQ
}

locals {
  conformance_pack_elasticbeanstalk_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ElasticBeanstalk"
  })
}

control "elastic_beanstalk_enhanced_health_reporting_enabled" {
  title       = "Elastic Beanstalk enhanced health reporting should be enabled"
  description = "AWS Elastic Beanstalk enhanced health reporting enables a more rapid response to changes in the health of the underlying infrastructure. These changes could result in a lack of availability of the application. Elastic Beanstalk enhanced health reporting provides a status descriptor to gauge the severity of the identified issues and identify possible causes to investigate."
  query       = query.elastic_beanstalk_enhanced_health_reporting_enabled

  tags = merge(local.conformance_pack_elasticbeanstalk_common_tags, {
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    rbi_itf_nbfc                           = "true"
  })
}

control "elastic_beanstalk_environment_logs_to_cloudwatch" {
  title       = "Elastic Beanstalk environments should have enhanced health reporting enabled"
  description = "This control checks whether an AWS Elastic Beanstalk environment is configured to send logs to CloudWatch Logs. The control fails if the environment isn't configured to send logs to CloudWatch Logs."
  query       = query.elastic_beanstalk_environment_logs_to_cloudwatch

  tags = merge(local.conformance_pack_elasticbeanstalk_common_tags, {
    acsc_essential_eight = "true"
    nist_csf_v2          = "true"
    pci_dss_v40          = "true"
  })
}

control "elastic_beanstalk_environment_managed_updates_enabled" {
  title       = "Elastic Beanstalk environment should have managed updates enabled"
  description = "This control checks whether managed platform updates in an AWS Elastic Beanstalk environment is enabled. The rule is COMPLIANT if the value for ManagedActionsEnabled is set to true. The rule is NON_COMPLIANT if the value for ManagedActionsEnabled is set to false, or if a parameter is provided and its value does not match the existing configurations."
  query       = query.elastic_beanstalk_environment_managed_updates_enabled

  tags = merge(local.conformance_pack_elasticbeanstalk_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

query "elastic_beanstalk_enhanced_health_reporting_enabled" {
  sql = <<-EOQ
    select
      application_name as resource,
      case
        when health_status is not null and health is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when health_status is not null and health is not null then application_name || ' enhanced health check enabled.'
        else application_name || ' enhanced health check disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elastic_beanstalk_environment;
  EOQ
}

query "elastic_beanstalk_environment_logs_to_cloudwatch" {
  sql = <<-EOQ
    with beanstalk_environment_logs_enabled as (
      select
        distinct e.arn
      from
        aws_elastic_beanstalk_environment as e,
        jsonb_array_elements(e.configuration_settings) as c,
        jsonb_array_elements(c -> 'OptionSettings') as s
      where
        s ->> 'OptionName' = 'StreamLogs'
        and s ->> 'Value' = 'true'
      group by
        arn
    )
    select
      e.arn as resource,
      case
        when l.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when l.arn is not null then title || ' send logs to AWS CloudWatch.'
        else title || ' does not send logs to AWS CloudWatch.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_elastic_beanstalk_environment as e
      left join beanstalk_environment_logs_enabled as l on e.arn = l.arn;
  EOQ
}

query "elastic_beanstalk_environment_managed_updates_enabled" {
  sql = <<-EOQ
    with beanstalk_environment_logs_enabled as (
      select
        distinct e.arn
      from
        aws_elastic_beanstalk_environment as e,
        jsonb_array_elements(e.configuration_settings) as c,
        jsonb_array_elements(c -> 'OptionSettings') as s
      where
        s ->> 'OptionName' = 'ManagedActionsEnabled'
        and s ->> 'Value' = 'true'
      group by
        arn
    )
    select
      e.arn as resource,
      case
        when l.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when l.arn is not null then title || ' managed actions Enabled.'
        else title || ' managed actions disabled.'
      end as reason
      ${local.tag_dimensions_sql}
    ${local.common_dimensions_sql}
    from
      aws_elastic_beanstalk_environment as e
      left join beanstalk_environment_logs_enabled as l on e.arn = l.arn;
  EOQ
}
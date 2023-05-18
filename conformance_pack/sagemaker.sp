locals {
  conformance_pack_sagemaker_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SageMaker"
  })
}

control "sagemaker_notebook_instance_encrypted_with_kms_cmk" {
  title       = "SageMaker notebook instances should be encrypted using CMK"
  description = "This control checks if SageMaker notebook instance storage volumes are encrypted with Amazon KMS Customer Master Keys (CMKs) instead of AWS managed-keys."
  query       = query.sagemaker_notebook_instance_encrypted_with_kms_cmk

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    other_checks = "true"
  })
}

control "sagemaker_notebook_instance_direct_internet_access_disabled" {
  title       = "SageMaker notebook instances should not have direct internet access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon SageMaker notebooks do not allow direct internet access."
  query       = query.sagemaker_notebook_instance_direct_internet_access_disabled

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
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

control "sagemaker_notebook_instance_encryption_at_rest_enabled" {
  title       = "SageMaker notebook instance encryption should be enabled"
  description = "To help protect data at rest, ensure encryption with AWS Key Management Service (AWS KMS) is enabled for your SageMaker notebook."
  query       = query.sagemaker_notebook_instance_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
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

control "sagemaker_endpoint_configuration_encryption_at_rest_enabled" {
  title       = "SageMaker endpoint configuration encryption should be enabled"
  description = "To help protect data at rest, ensure encryption with AWS Key Management Service (AWS KMS) is enabled for your SageMaker endpoint."
  query       = query.sagemaker_endpoint_configuration_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
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

control "sagemaker_model_in_vpc" {
  title       = "SageMaker models should be in a VPC"
  description = "Manage access to the AWS Cloud by ensuring SageMaker models are within an Amazon Virtual Private Cloud (Amazon VPC)."
  query       = query.sagemaker_model_in_vpc

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    other_checks = "true"
  })
}

control "sagemaker_model_network_isolation_enabled" {
  title       = "SageMaker models should have network isolation enabled"
  description = "SageMaker models are internet-enabled by default. Network isolation should be enabled to avoid external network access to your inference containers."
  query       = query.sagemaker_model_network_isolation_enabled

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    other_checks = "true"
  })
}

control "sagemaker_notebook_instance_in_vpc" {
  title       = "SageMaker notebook instances should be in a VPC"
  description = "Manage access to the AWS Cloud by ensuring SageMaker notebook instances are within an Amazon Virtual Private Cloud (Amazon VPC)."
  query       = query.sagemaker_notebook_instance_in_vpc

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    other_checks = "true"
  })
}

control "sagemaker_notebook_instance_root_access_disabled" {
  title       = "SageMaker notebook instances root access should be disabled"
  description = "Users with root access have administrator privileges and users can access and edit all files on a notebook instance. It is recommeneded to disable root access to restrict users from accessing and editing all the files."
  query       = query.sagemaker_notebook_instance_root_access_disabled

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    other_checks = "true"
  })
}

control "sagemaker_training_job_in_vpc" {
  title       = "SageMaker training jobs should be in VPC"
  description = "Manage access to the AWS Cloud by ensuring SageMaker training jobs are within an Amazon Virtual Private Cloud (Amazon VPC)."
  query       = query.sagemaker_training_job_in_vpc

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    other_checks = "true"
  })
}

control "sagemaker_training_job_inter_container_traffic_encryption_enabled" {
  title       = "SageMaker training jobs should be enabled with inter-container traffic encryption"
  description = "Inter-container traffic encryption shoule be used to protect data that is transmitted between instances while performing distributed training. This control in compliant when inter-container traffic encryption is enabled."
  query       = query.sagemaker_training_job_inter_container_traffic_encryption_enabled

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    other_checks = "true"
  })
}

control "sagemaker_training_job_network_isolation_enabled" {
  title       = "SageMaker training jobs should have network isolation enabled"
  description = "SageMaker training jobs are internet-enabled by default. Network isolation should be enabled to avoid external network access to your training."
  query       = query.sagemaker_training_job_network_isolation_enabled

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    other_checks = "true"
  })
}

control "sagemaker_training_job_volume_and_data_encryption_enabled" {
  title       = "SageMaker training jobs volumes and outputs should have KMS encryption enabled"
  description = "Ensure that SageMaker training jobs have volumes and outputs with KMS encryption enabled in order to have a more granular control over the data-at-rest encryption/decryption process and to meet compliance requirements."
  query       = query.sagemaker_training_job_volume_and_data_encryption_enabled

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    other_checks = "true"
  })
}

query "sagemaker_notebook_instance_encrypted_with_kms_cmk" {
  sql = <<-EOQ
    select
      i.arn as resource,
      case
        when kms_key_id is null then 'alarm'
        when k.key_manager = 'CUSTOMER' then 'ok'
        else 'alarm'
      end as status,
      case
        when kms_key_id is null then i.title || ' encryption disabled.'
        when k.key_manager = 'CUSTOMER' then i.title || ' encryption at rest with CMK enabled.'
        else i.title || ' encryption at rest with CMK disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_sagemaker_notebook_instance as i
      left join aws_kms_key as k on k.arn = i.kms_key_id;
  EOQ
}

query "sagemaker_notebook_instance_direct_internet_access_disabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when direct_internet_access = 'Enabled' then 'alarm'
        else 'ok'
      end status,
      case
        when direct_internet_access = 'Enabled' then title || ' direct internet access enabled.'
        else title || ' direct internet access disabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_notebook_instance;
  EOQ
}

query "sagemaker_notebook_instance_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when kms_key_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when kms_key_id is null then title || ' encryption at rest enabled'
        else title || ' encryption at rest not enabled'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_notebook_instance;
  EOQ
}

query "sagemaker_endpoint_configuration_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when kms_key_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when kms_key_id is null then title || ' encryption at rest disabled.'
        else title || ' encryption at rest enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_endpoint_configuration;
  EOQ
}

query "sagemaker_model_in_vpc" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_config is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when vpc_config is not null then title || ' in VPC.'
        else title || ' not in VPC.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_model;
  EOQ
}

query "sagemaker_model_network_isolation_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when enable_network_isolation then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_network_isolation then title || ' network isolation enabled.'
        else title || ' network isolation disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_model;
  EOQ
}

query "sagemaker_notebook_instance_in_vpc" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when subnet_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when subnet_id is not null then title || ' in VPC.'
        else title || ' not in VPC.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_notebook_instance;
  EOQ
}

query "sagemaker_notebook_instance_root_access_disabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when root_access = 'Disabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when root_access = 'Disabled' then title || ' root access disabled.'
        else title || ' root access enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_notebook_instance;
  EOQ
}

query "sagemaker_training_job_in_vpc" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_config is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when vpc_config is not null then title || ' in VPC.'
        else title || ' not in VPC.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_training_job;
  EOQ
}

query "sagemaker_training_job_inter_container_traffic_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when enable_inter_container_traffic_encryption then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_inter_container_traffic_encryption then title || ' inter-container traffic encryption enabled.'
        else title || ' inter-container traffic encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_training_job;
  EOQ
}

query "sagemaker_training_job_network_isolation_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when enable_network_isolation then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_network_isolation then title || ' network isolation enabled.'
        else title || ' network isolation disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_training_job;
  EOQ
}

query "sagemaker_training_job_volume_and_data_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when output_data_config ->> 'KmsKeyId' is null or output_data_config ->> 'KmsKeyId' = '' then 'alarm'
        else 'ok'
      end as status,
      case
        when output_data_config ->> 'KmsKeyId' is null or output_data_config ->> 'KmsKeyId' = '' then title || ' volume and output data encryption disabled.'
        else title || ' volume and output data encryption enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sagemaker_training_job;
  EOQ
}

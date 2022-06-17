locals {
  conformance_pack_sagemaker_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SageMaker"
  })
}

control "sagemaker_notebook_instance_direct_internet_access_disabled" {
  title       = "SageMaker notebook instances should not have direct internet access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon SageMaker notebooks do not allow direct internet access."
  sql         = query.sagemaker_notebook_instance_direct_internet_access_disabled.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "sagemaker_notebook_instance_encryption_at_rest_enabled" {
  title       = "SageMaker notebook instance encryption should be enabled"
  description = "To help protect data at rest, ensure encryption with AWS Key Management Service (AWS KMS) is enabled for your SageMaker notebook."
  sql         = query.sagemaker_notebook_instance_encryption_at_rest_enabled.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "sagemaker_endpoint_configuration_encryption_at_rest_enabled" {
  title       = "SageMaker endpoint configuration encryption should be enabled"
  description = "To help protect data at rest, ensure encryption with AWS Key Management Service (AWS KMS) is enabled for your SageMaker endpoint."
  sql         = query.sagemaker_endpoint_configuration_encryption_at_rest_enabled.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "sagemaker_model_in_vpc" {
  title       = "SageMaker model should be in a VPC"
  description = "Manage access to the AWS Cloud by ensuring SageMaker models are within an Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.sagemaker_model_in_vpc.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    extra_check = "true"
  })
}

control "sagemaker_model_network_isolation_enabled" {
  title       = "SageMaker models network isolation should be enabled"
  description = ""
  sql         = query.sagemaker_model_network_isolation_enabled.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    extra_check = "true"
  })
}

control "sagemaker_notebook_instance_in_vpc" {
  title       = "SageMaker notebook instances should be in a VPC"
  description = "Manage access to the AWS Cloud by ensuring SageMaker notebook instances are within an Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.sagemaker_notebook_instance_in_vpc.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    extra_check = "true"
  })
}

control "sagemaker_notebook_instance_root_access_disabled" {
  title       = "SageMaker Notebook instances root access should be disabled"
  description = ""
  sql         = query.sagemaker_notebook_instance_root_access_disabled.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    extra_check = "true"
  })
}

control "sagemaker_training_job_in_vpc" {
  title       = "SageMaker training jobs should be in VPC"
  description = "Manage access to the AWS Cloud by ensuring SageMaker training jobs are within an Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.sagemaker_training_job_in_vpc.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    extra_check = "true"
  })
}

control "sagemaker_training_job_inter_container_traffic_encryption_enabled" {
  title       = "SageMaker training jobs should be enabled with inter-container traffic encryption"
  description = ""
  sql         = query.sagemaker_training_job_inter_container_traffic_encryption_enabled.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    extra_check = "true"
  })
}

control "sagemaker_training_job_network_isolation_enabled" {
  title       = "SageMaker training jobs should have network isolation enabled"
  description = ""
  sql         = query.sagemaker_training_job_network_isolation_enabled.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    extra_check = "true"
  })
}

control "sagemaker_training_job_volume_and_data_encryption_enabled" {
  title       = "SageMaker training job volumes and output should have KMS encryption enabled"
  description = ""
  sql         = query.sagemaker_training_job_volume_and_data_encryption_enabled.sql

  tags = merge(local.conformance_pack_sagemaker_common_tags, {
    extra_check = "true"
  })
}

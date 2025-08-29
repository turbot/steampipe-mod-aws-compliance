locals {
  foundational_security_sagemaker_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/SageMaker"
  })
}

benchmark "foundational_security_sagemaker" {
  title         = "SageMaker"
  documentation = file("./foundational_security/docs/foundational_security_sagemaker.md")
  children = [
    control.foundational_security_sagemaker_1,
    control.foundational_security_sagemaker_2,
    control.foundational_security_sagemaker_3,
    control.foundational_security_sagemaker_4,
    control.foundational_security_sagemaker_5,
    control.foundational_security_sagemaker_8
  ]

  tags = merge(local.foundational_security_sagemaker_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_sagemaker_1" {
  title         = "1 SageMaker notebook instances should not have direct internet access"
  description   = "This control checks whether direct internet access is disabled for an SageMaker notebook instance. To do this, it checks whether the DirectInternetAccess field is disabled for the notebook instance. If you configure your SageMaker instance without a VPC, then by default direct internet access is enabled on your instance. You should configure your instance with a VPC and change the default setting to Disable — Access the internet through a VPC."
  severity      = "high"
  query         = query.sagemaker_notebook_instance_direct_internet_access_disabled
  documentation = file("./foundational_security/docs/foundational_security_sagemaker_1.md")

  tags = merge(local.foundational_security_sagemaker_common_tags, {
    foundational_security_item_id  = "sagemaker_1"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_sagemaker_2" {
  title         = "2 SageMaker notebook instances should be launched in a custom VPC"
  description   = "This control checks if an Amazon SageMaker notebook instance is launched within a custom virtual private cloud (VPC). This control fails if a SageMaker notebook instance is not launched within a custom VPC or if it is launched in the SageMaker service VPC."
  severity      = "high"
  query         = query.sagemaker_notebook_instance_in_vpc
  documentation = file("./foundational_security/docs/foundational_security_sagemaker_2.md")

  tags = merge(local.foundational_security_sagemaker_common_tags, {
    foundational_security_item_id  = "sagemaker_2"
    foundational_security_category = "resources_within_vpc"
  })
}

control "foundational_security_sagemaker_3" {
  title         = "3 Users should not have root access to SageMaker notebook instances"
  description   = "This control checks whether root access is turned on for an Amazon SageMaker notebook instance. The control fails if root access is turned on for a SageMaker notebook instance."
  severity      = "high"
  query         = query.sagemaker_notebook_instance_root_access_disabled
  documentation = file("./foundational_security/docs/foundational_security_sagemaker_3.md")

  tags = merge(local.foundational_security_sagemaker_common_tags, {
    foundational_security_item_id  = "sagemaker_3"
    foundational_security_category = "root_user_access_restrictions"
  })
}

control "foundational_security_sagemaker_4" {
  title         = "4 SageMaker endpoint production variants should have an initial instance count greater than 1"
  description   = "This control checks whether production variants of an Amazon SageMaker AI endpoint have an initial instance count greater than 1. The control fails if the endpoint's production variants have only 1 initial instance."
  severity      = "medium"
  query         = query.sagemaker_endpoint_configuration_prod_instance_count_greater_than_one
  documentation = file("./foundational_security/docs/foundational_security_sagemaker_4.md")

  tags = merge(local.foundational_security_sagemaker_common_tags, {
    foundational_security_item_id  = "sagemaker_4"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_sagemaker_5" {
  title         = "5 SageMaker models should have network isolation enabled"
  description   = "This control checks whether an Amazon SageMaker AI hosted model has network isolation enabled. The control fails if the EnableNetworkIsolation parameter for the hosted model is set to False."
  severity      = "medium"
  query         = query.sagemaker_model_network_isolation_enabled
  documentation = file("./foundational_security/docs/foundational_security_sagemaker_5.md")

  tags = merge(local.foundational_security_sagemaker_common_tags, {
    foundational_security_item_id  = "sagemaker_5"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_sagemaker_8" {
  title         = "8 SageMaker notebook instances should run on supported platforms"
  description   = "This control checks whether an Amazon SageMaker AI notebook instance is configured to run on a supported platform, based on the platform identifier specified for the notebook instance. The control fails if the notebook instance is configured to run on a platform that's no longer supported."
  severity      = "medium"
  query         = query.sagemaker_notebook_instance_supported_platform_version
  documentation = file("./foundational_security/docs/foundational_security_sagemaker_8.md")

  tags = merge(local.foundational_security_sagemaker_common_tags, {
    foundational_security_item_id  = "sagemaker_8"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}

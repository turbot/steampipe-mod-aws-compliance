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
    control.foundational_security_sagemaker_3
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

locals {
  all_controls_sagemaker_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/SageMaker"
  })
}

benchmark "all_controls_sagemaker" {
  title       = "SageMaker"
  description = "This section contains recommendations for configuring SageMaker resources."
  children = [
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_endpoint_configuration_prod_instance_count_greater_than_one,
    control.sagemaker_model_in_vpc,
    control.sagemaker_model_network_isolation_enabled,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_encrypted_with_kms_cmk,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_in_vpc,
    control.sagemaker_notebook_instance_root_access_disabled,
    control.sagemaker_notebook_instance_supported_platform_version,
    control.sagemaker_training_job_in_vpc,
    control.sagemaker_training_job_inter_container_traffic_encryption_enabled,
    control.sagemaker_training_job_network_isolation_enabled,
    control.sagemaker_training_job_volume_and_data_encryption_enabled
  ]

  tags = merge(local.all_controls_sagemaker_common_tags, {
    type = "Benchmark"
  })
}

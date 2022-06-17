locals {
  extra_checks_sagemaker_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_sagemaker" {
  title       = "SageMaker Extra Checks"
  description = "TODO"
  children = [
    control.sagemaker_model_in_vpc,
    control.sagemaker_model_network_isolation_enabled,
    control.sagemaker_notebook_instance_in_vpc,
    control.sagemaker_notebook_instance_root_access_disabled,
    control.sagemaker_training_job_in_vpc,
    control.sagemaker_training_job_inter_container_traffic_encryption_enabled,
    control.sagemaker_training_job_network_isolation_enabled,
    control.sagemaker_training_job_volume_and_data_encryption_enabled
  ]

  tags = local.extra_checks_sagemaker_common_tags
}

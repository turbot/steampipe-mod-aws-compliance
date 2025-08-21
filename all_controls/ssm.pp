locals {
  all_controls_ssm_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/SSM"
  })
}

benchmark "all_controls_ssm" {
  title       = "SSM"
  description = "This section contains recommendations for configuring SSM resources."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_automation_cloudwatch_logging_enabled,
    control.ssm_document_block_public_sharing_setting_enabled,
    control.ssm_document_prohibit_public_access,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.ssm_parameter_encryption_enabled
  ]

  tags = merge(local.all_controls_ssm_common_tags, {
    type = "Benchmark"
  })
}

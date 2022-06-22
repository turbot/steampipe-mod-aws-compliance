locals {
  extra_checks_ec2_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_ec2" {
  title       = "EC2"
  description = "This benchmark contains additional checks for AWS EC2 servcice, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.ec2_instance_publicly_accessible_iam_profile_attached,
    control.ec2_user_data_no_secrets
  ]

  tags = local.extra_checks_ec2_common_tags
}

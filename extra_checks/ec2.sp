locals {
  extra_checks_ec2_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_ec2" {
  title       = "EC2 Extra Checks"
  description = "TODO"
  children = [
    control.ec2_instance_publicly_accessible_iam_profile_attached
  ]

  tags = local.extra_checks_ec2_common_tags
}

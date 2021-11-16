locals {
  control_tower_common_tags = {
    control_tower = "true"
    plugin        = "aws"
  }
}

benchmark "control_tower" {
  title         = "AWS Audit Manager Control Tower Guardrails"
  description   = "AWS Control Tower is a service that enables you to enforce and manage governance rules for security, operations, and compliance at scale across all your organizations and accounts in the AWS Cloud."
  documentation = file("./control_tower/docs/control_tower_overview.md")
  children = [
    benchmark.control_tower_disallow_instances,
    benchmark.control_tower_disallow_internet_connection,
    benchmark.control_tower_disallow_public_access,
    benchmark.control_tower_ebs_checks,
    benchmark.control_tower_multi_factor_authentication
  ]
  tags = local.control_tower_common_tags
}

locals {
  foundational_security_inspector_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Inspector"
  })
}

benchmark "foundational_security_inspector" {
  title         = "Inspector"
  documentation = file("./foundational_security/docs/foundational_security_inspector.md")
  children = [
    control.foundational_security_inspector_1,
    control.foundational_security_inspector_2,
    control.foundational_security_inspector_3,
    control.foundational_security_inspector_4
  ]

  tags = merge(local.foundational_security_inspector_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_inspector_1" {
  title         = "1 Amazon Inspector EC2 scanning should be enabled"
  description   = "This control checks whether Amazon Inspector EC2 scanning is enabled. For a standalone account, the control fails if Amazon Inspector EC2 scanning is disabled in the account. In a multi-account environment, the control fails if the delegated Amazon Inspector administrator account and all member accounts don't have EC2 scanning enabled."
  severity      = "high"
  query         = query.inspector_ec2_scanning_enabled
  documentation = file("./foundational_security/docs/foundational_security_inspector_1.md")

  tags = merge(local.foundational_security_inspector_common_tags, {
    foundational_security_item_id  = "inspector_1"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_inspector_2" {
  title         = "2 Amazon Inspector ECR scanning should be enabled"
  description   = "This control checks whether Amazon Inspector ECR scanning is enabled. For a standalone account, the control fails if Amazon Inspector ECR scanning is disabled in the account. In a multi-account environment, the control fails if the delegated Amazon Inspector administrator account and all member accounts don't have ECR scanning enabled."
  severity      = "high"
  query         = query.inspector_ecr_scanning_enabled
  documentation = file("./foundational_security/docs/foundational_security_inspector_2.md")

  tags = merge(local.foundational_security_inspector_common_tags, {
    foundational_security_item_id  = "inspector_2"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_inspector_3" {
  title         = "3 Amazon Inspector Lambda code scanning should be enabled"
  description   = "This control checks whether Amazon Inspector Lambda code scanning is enabled. For a standalone account, the control fails if Amazon Inspector Lambda code scanning is disabled in the account. In a multi-account environment, the control fails if the delegated Amazon Inspector administrator account and all member accounts don't have Lambda code scanning enabled."
  severity      = "medium"
  query         = query.inspector_lambda_code_scanning_enabled
  documentation = file("./foundational_security/docs/foundational_security_inspector_3.md")

  tags = merge(local.foundational_security_inspector_common_tags, {
    foundational_security_item_id  = "inspector_3"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_inspector_4" {
  title         = "4 Amazon Inspector Lambda standard scanning should be enabled"
  description   = "This control checks whether Amazon Inspector Lambda standard scanning is enabled. For a standalone account, the control fails if Amazon Inspector Lambda standard scanning is disabled in the account. In a multi-account environment, the control fails if the delegated Amazon Inspector administrator account and all member accounts don't have Lambda standard scanning enabled."
  severity      = "high"
  query         = query.inspector_lambda_scanning_enabled
  documentation = file("./foundational_security/docs/foundational_security_inspector_4.md")

  tags = merge(local.foundational_security_inspector_common_tags, {
    foundational_security_item_id  = "inspector_4"
    foundational_security_category = "detection_services"
  })
}
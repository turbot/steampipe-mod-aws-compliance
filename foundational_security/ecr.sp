locals {
  foundational_security_ecr_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/ECR"
  })
}

benchmark "foundational_security_ecr" {
  title         = "Elastic Container Registry"
  documentation = file("./foundational_security/docs/foundational_security_ecr.md")
  children = [
    control.foundational_security_ecr_3
  ]
  tags          = local.foundational_security_ecr_common_tags
}

control "foundational_security_ecr_3" {
  title         = "3 ECR repositories should have at least one lifecycle policy configured"
  description   = "This control checks whether an Amazon ECR repository has at least one lifecycle policy configured. This control fails if an ECR repository does not have any lifecycle policies configured."
  severity      = "medium"
  sql           = query.ecr_repository_lifecycle_policy_configured.sql
  documentation = file("./foundational_security/docs/foundational_security_ecr_3.md")

  tags = merge(local.foundational_security_ecr_common_tags, {
    foundational_security_item_id  = "ecr_3"
    foundational_security_category = "resource_configuration"
  })
}

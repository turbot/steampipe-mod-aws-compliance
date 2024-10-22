locals {
  foundational_security_ecr_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/ECR"
  })
}

benchmark "foundational_security_ecr" {
  title         = "Elastic Container Registry"
  documentation = file("./foundational_security/docs/foundational_security_ecr.md")
  children = [
    control.foundational_security_ecr_1,
    control.foundational_security_ecr_2,
    control.foundational_security_ecr_3
  ]

  tags = merge(local.foundational_security_ecr_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_ecr_1" {
  title         = "1 ECR private repositories should have image scanning configured"
  description   = "This control checks whether a private ECR repository has image scanning configured. This control fails if a private ECR repository doesn't have image scanning configured."
  severity      = "high"
  query         = query.ecr_repository_image_scan_on_push_enabled
  documentation = file("./foundational_security/docs/foundational_security_ecr_1.md")

  tags = merge(local.foundational_security_ecr_common_tags, {
    foundational_security_item_id  = "ecr_1"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}

control "foundational_security_ecr_2" {
  title         = "2 ECR private repositories should have tag immutability configured"
  description   = "This control checks whether a private ECR repository has tag immutability enabled. This control fails if a private ECR repository has tag immutability disabled. This rule passes if tag immutability is enabled and has the value IMMUTABLE."
  severity      = "medium"
  query         = query.ecr_repository_tag_immutability_enabled
  documentation = file("./foundational_security/docs/foundational_security_ecr_2.md")

  tags = merge(local.foundational_security_ecr_common_tags, {
    foundational_security_item_id  = "ecr_2"
    foundational_security_category = "tagging"
  })
}

control "foundational_security_ecr_3" {
  title         = "3 ECR repositories should have at least one lifecycle policy configured"
  description   = "This control checks whether an Amazon ECR repository has at least one lifecycle policy configured. This control fails if an ECR repository does not have any lifecycle policies configured."
  severity      = "medium"
  query         = query.ecr_repository_lifecycle_policy_configured
  documentation = file("./foundational_security/docs/foundational_security_ecr_3.md")

  tags = merge(local.foundational_security_ecr_common_tags, {
    foundational_security_item_id  = "ecr_3"
    foundational_security_category = "resource_configuration"
  })
}


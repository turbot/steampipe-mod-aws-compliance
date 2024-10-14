locals {
  foundational_security_athena_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Athena"
  })
}

benchmark "foundational_security_athena" {
  title         = "Athena"
  documentation = file("./foundational_security/docs/foundational_security_athena.md")
  children = [
    control.foundational_security_athena_1
  ]

  tags = merge(local.foundational_security_athena_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_athena_1" {
  title         = "1 Athena workgroups should be encrypted at rest"
  description   = "This control checks if an Athena workgroup is encrypted at rest. The control fails if an Athena workgroup isn't encrypted at rest."
  severity      = "medium"
  query         = query.athena_workgroup_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_athena_1.md")

  tags = merge(local.foundational_security_athena_common_tags, {
    foundational_security_item_id  = "athena_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

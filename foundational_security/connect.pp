locals {
  foundational_security_connect_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Connect"
  })
}

benchmark "foundational_security_connect" {
  title         = "Connect"
  documentation = file("./foundational_security/docs/foundational_security_connect.md")
  children = [
    control.foundational_security_connect_2
  ]

  tags = merge(local.foundational_security_connect_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_connect_2" {
  title         = "2 Amazon Connect instances should have CloudWatch logging enabled"
  description   = "This control checks whether an Amazon Connect instance is configured to generate and store flow logs in an Amazon CloudWatch log group. The control fails if the Amazon Connect instance isn't configured to generate and store flow logs in a CloudWatch log group."
  severity      = "medium"
  query         = query.connect_instance_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_connect_2.md")

  tags = merge(local.foundational_security_connect_common_tags, {
    foundational_security_item_id  = "connect_2"
    foundational_security_category = "logging"
  })
}



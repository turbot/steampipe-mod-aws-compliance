locals {
  foundational_security_kinesis_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Kinesis"
  })
}

benchmark "foundational_security_kinesis" {
  title         = "Kinesis"
  documentation = file("./foundational_security/docs/foundational_security_kinesis.md")
  children = [
    control.foundational_security_kinesis_1
  ]

  tags = merge(local.foundational_security_kinesis_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_kinesis_1" {
  title         = "1 Kinesis Data Streams should be encrypted at rest"
  description   = "This control checks if Kinesis Data Streams are encrypted at rest with server-side encryption. This control fails if a Kinesis stream is not encrypted at rest with server-side encryption."
  severity      = "medium"
  query         = query.kinesis_stream_server_side_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_kinesis_1.md")

  tags = merge(local.foundational_security_kinesis_common_tags, {
    foundational_security_item_id  = "kinesis_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

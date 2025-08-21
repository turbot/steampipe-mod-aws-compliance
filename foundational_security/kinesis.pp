locals {
  foundational_security_kinesis_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Kinesis"
  })
}

benchmark "foundational_security_kinesis" {
  title         = "Kinesis"
  documentation = file("./foundational_security/docs/foundational_security_kinesis.md")
  children = [
    control.foundational_security_kinesis_1,
    control.foundational_security_kinesis_3
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

control "foundational_security_kinesis_3" {
  title         = "3 Kinesis streams should have an adequate data retention period"
  description   = "This control checks whether an Amazon Kinesis data stream has a data retention period greater than or equal to the specified time frame. The control fails if the data retention period is less than the specified time frame. Unless you provide a custom parameter value for the data retention period, Security Hub uses a default value of 168 hours."
  severity      = "medium"
  query         = query.kinesis_stream_retention_period_168_hours
  documentation = file("./foundational_security/docs/foundational_security_kinesis_3.md")

  tags = merge(local.foundational_security_kinesis_common_tags, {
    foundational_security_item_id  = "kinesis_3"
    foundational_security_category = "backups_enabled"
  })
}

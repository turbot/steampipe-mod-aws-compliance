locals {
  foundational_security_transfer_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Transfer"
  })
}

benchmark "foundational_security_transfer" {
  title         = "Transfer"
  documentation = file("./foundational_security/docs/foundational_security_transfer.md")
  children = [
    control.foundational_security_transfer_2,
    control.foundational_security_transfer_3
  ]

  tags = merge(local.foundational_security_transfer_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_transfer_2" {
  title         = "2 Transfer Family servers should not use FTP protocol for endpoint connection"
  description   = "This control checks whether an AWS Transfer Family server uses a protocol other than FTP for endpoint connection. The control fails if the server uses FTP protocol for a client to connect to the server's endpoint."
  severity      = "medium"
  query         = query.transfer_server_no_ftp_protocol
  documentation = file("./foundational_security/docs/foundational_security_transfer_2.md")

  tags = merge(local.foundational_security_transfer_common_tags, {
    foundational_security_item_id  = "transfer_2"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_transfer_3" {
  title         = "3 Transfer Family connectors should have logging enabled"
  description   = "This control checks whether Amazon CloudWatch logging is enabled for an AWS Transfer Family connector. The control fails if CloudWatch logging isn't enabled for the connector."
  severity      = "medium"
  query         = query.transfer_connector_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_transfer_3.md")

  tags = merge(local.foundational_security_transfer_common_tags, {
    foundational_security_item_id  = "transfer_3"
    foundational_security_category = "logging"
  })
}
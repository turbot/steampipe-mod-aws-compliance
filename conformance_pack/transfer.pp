locals {
  conformance_pack_transfer_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Transfer"
  })
}

control "transfer_server_no_ftp_protocol" {
  title         = "Transfer Family servers should not use FTP protocol for endpoint connection"
  description   = "This control checks whether an AWS Transfer Family server uses a protocol other than FTP for endpoint connection. The control fails if the server uses FTP protocol for a client to connect to the server's endpoint."
  query         = query.transfer_server_no_ftp_protocol

  tags = local.conformance_pack_transfer_common_tags
}

control "transfer_connector_logging_enabled" {
  title         = "Transfer Family connectors should have logging enabled"
  description   = "This control checks whether Amazon CloudWatch logging is enabled for an AWS Transfer Family connector. The control fails if CloudWatch logging isn't enabled for the connector."
  query         = query.transfer_connector_logging_enabled

  tags = local.conformance_pack_transfer_common_tags
}

query "transfer_server_no_ftp_protocol" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when protocols @> '[ "FTP" ]' then 'alarm'
        else 'ok'
      end as status,
      case
        when protocols @> '[ "FTP" ]' then title || ' uses FTP protocol for endpoint connection.'
        else title || ' does not uses FTP protocol for endpoint connection.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_transfer_server;
  EOQ
}

query "transfer_connector_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when logging_role is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when logging_role is not null then title || ' logging enabled'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_transfer_connector;
  EOQ
}

locals {
  conformance_pack_dax_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DAX"
  })
}

control "dax_cluster_encryption_at_rest_enabled" {
  title       = "DynamoDB Accelerator (DAX) clusters should be encrypted at rest"
  description = "This control checks whether a DAX cluster is encrypted at rest. Encrypting data at rest reduces the risk of data stored on disk being accessed by a user not authenticated to AWS. The encryption adds another set of access controls to limit the ability of unauthorized users to access to the data. For example, API permissions are required to decrypt the data before it can be read."
  query       = query.dax_cluster_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_dax_common_tags, {
    gdpr                                   = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
  })
}

query "dax_cluster_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when sse_description ->> 'Status' = 'ENABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when sse_description ->> 'Status' = 'ENABLED' then title || ' encryption at rest enabled.'
        else title || ' encryption at rest not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_dax_cluster;
  EOQ
}

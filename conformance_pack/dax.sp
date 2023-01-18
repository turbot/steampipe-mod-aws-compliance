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
    gdpr            = "true"
    gxp_eu_annex_11 = "true"
    hipaa           = "true"
  })
}
